require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

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

end
