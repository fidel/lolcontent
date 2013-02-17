require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base

  belongs_to :user

  attr_accessible :photo, :title
  attr_accessible :photo, :title, :user_id, :published, as: :admin

  mount_uploader :photo, PhotoUploader

  scope :published, where(published: true)
  scope :waiting,   where('published IS NULL or published = false')
end
