class Message < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :text, presence: true
  # mount_uploader :image, ImageUploader
end
