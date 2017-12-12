class Member < ApplicationRecord
  scope :default_order, -> { order(:order) }

  belongs_to :event
  has_many :tmp_payments
  has_many :act_payments

  validates :name, presence: true
end
