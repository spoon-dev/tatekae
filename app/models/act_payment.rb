class ActPayment < ApplicationRecord
  attr_accessor :_destroy
  belongs_to :item
  belongs_to :member

  delegate :name, to: :member, prefix: true

  after_initialize :set_destroy

  private
    def set_destroy
      self._destroy = !self.persisted?
    end
end
