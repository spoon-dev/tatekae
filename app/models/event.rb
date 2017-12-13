class Event < ApplicationRecord
  belongs_to :calc
  belongs_to :locale

  has_many   :items,   dependent: :destroy, inverse_of: :event
  has_many   :members, dependent: :destroy, inverse_of: :event

  accepts_nested_attributes_for :members, reject_if: :all_blank, allow_destroy: true

  validates :title, :locale_id, :calc_id, presence: true
  validates :title, length: { maximum: 30 }

  def available_calcs
    Calc.cached.locale_is(locale)
  end

  def available_categories
    Category.cached.locale_is(locale)
  end

  def available_members
    members.default_order
  end

  def items_grouped_by_date
    hashed_items = {}
    items.registered_at_desc_order.each do |item|
      date = I18n.l(item.registered_at, format: :yyyymmdd).to_s
      p date
      hashed_items[date] ||= []
      hashed_items[date] << item
    end
    p hashed_items
  end
end
