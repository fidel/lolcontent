require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base

  belongs_to :user

  attr_accessible :photo, :title, :user_id

  mount_uploader :photo, PhotoUploader
end
