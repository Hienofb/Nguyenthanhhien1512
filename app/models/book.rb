class Book < ApplicationRecord
  belongs_to :author

  validates_presence_of :title, :author, :desctiption, :page, :quantity
  validates_uniqueness_of :title
  validates_numericality_of :quantity
    
end
