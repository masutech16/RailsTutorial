class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  scope :created_order, -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

  mount_uploader :picture, PictureUploader

  def star?(user)
    self.favorites.exists?(user_id: user.id)
  end


  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, 'should be less than 5MB')
      end
    end
end
