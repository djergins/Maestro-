class Piece < ActiveRecord::Base
  belongs_to :library
  validates :library_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  has_many :parts

  def self.search(search)

    if search
       find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
