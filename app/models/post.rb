require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  after_validation :move_friendly_id_error_to_title

  belongs_to :user

  attr_accessible :photo, :title
  attr_accessible :photo, :title, :user_id, :published, as: :admin

  mount_uploader :photo, PhotoUploader

  scope :published, where(published: true)
  scope :waiting,   where('published IS NULL or published = false')

  validates :title,
    length: { in: (3..255) },
    uniqueness: true,
    presence: true

  validates :photo,
    presence: true

  private

  def move_friendly_id_error_to_title
    errors.add :title, *errors.delete(:friendly_id) if errors[:friendly_id].present?
  end
end
