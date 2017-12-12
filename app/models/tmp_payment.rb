class TmpPayment < ApplicationRecord
  belongs_to :item
  belongs_to :member
end
