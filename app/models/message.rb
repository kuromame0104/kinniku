class Message < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :text, presence: true
  # mount_uploader :image, ImageUploader
end
