class Part < ActiveRecord::Base
  mount_uploader :piece, PieceUploader
  belongs_to :piece
  belongs_to :library
  validates  :piece_id, presence: true
  validates  :name, presence: true
end
