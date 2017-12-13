class TmpPayment < ApplicationRecord
  belongs_to :item
  belongs_to :member

  delegate :name, to: :member, prefix: true
end
