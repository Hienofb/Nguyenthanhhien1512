class Book < ApplicationRecord
  belongs_to :author

  # Validations
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 10 }
  validates :desctiption, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :page, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Callback to capitalize the first letter of each word in the title
  before_save :capitalize_title

  private

  # Capitalizes each word in the title
  def capitalize_title
    self.title = title.strip.split.map(&:capitalize).join(' ') if title.present?
  end
end
