class Comment < ApplicationRecord
  validates :body, :user_id, :photo_id, presence: true

  belongs_to :user
  belongs_to :photo
  has_many :likes, as: :likable
  
end
