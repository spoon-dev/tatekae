class Item < ApplicationRecord
  #attr_accessor :registered_at_date, :registered_at_time

  scope :registered_at_desc_order, -> { order("registered_at desc") }

  belongs_to :event, touch: true
  belongs_to :category

  has_one  :tmp_payment,  dependent: :destroy, inverse_of: :item
  has_one  :tmp_payer,    through: :act_payments, source: :member
  has_many :act_payments, dependent: :destroy, inverse_of: :item
  has_many :act_payers,   through: :act_payments, source: :member

  accepts_nested_attributes_for :tmp_payment,  allow_destroy: true
  accepts_nested_attributes_for :act_payments, allow_destroy: true

  delegate :name, to: :category, prefix: true
  delegate :icon, to: :category, prefix: true
  delegate :available_categories, to: :event
  delegate :available_members,    to: :event
  delegate :member_name, to: :tmp_payment, prefix: true

  validates :event_id, :category_id, :registered_at, presence: true
  validates :tmp_amount, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  after_initialize :set_default_category, :set_default_registered_at, :set_default_tmp_payment

  def registered_at_date
    registered_at.strftime('%Y/%m/%d')
  end

  def registered_at_time
    registered_at.strftime('%H:%M')
  end

  def available_act_payments
    available_members.map do |m|
      act_payments.find_or_initialize_by(member_id: m.id).tap do |act_payment|
        act_payment._destroy = false unless self.persisted?
      end
    end
  end

  private
    def set_default_category
      self.category ||= available_categories.first
    end

    def set_default_registered_at
      self.registered_at ||= DateTime.now
    end

    def set_default_tmp_payment
      self.tmp_payment || self.build_tmp_payment
      self.tmp_payment.member ||= available_members.first
    end
end
