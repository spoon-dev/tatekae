class Category < ApplicationRecord
  belongs_to :locale

  scope :locale_is, -> (locale) { where(locale_id: locale.id).order(:order) }

  def self.cached
    Rails.cache.fetch("Category") do
      self.all
    end
  end
end
