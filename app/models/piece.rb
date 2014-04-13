class Piece < ActiveRecord::Base
  belongs_to :library
  validates :library_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  has_many :parts
end
