class Library < ActiveRecord::Base
  belongs_to :user
  has_many :pieces, dependent: :destroy
  has_many :parts, dependent: :destroy
  accepts_nested_attributes_for :pieces
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
end
