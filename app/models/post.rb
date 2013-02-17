require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base
  attr_accessible :photo, :title, :user_id

  mount_uploader :photo, PhotoUploader
end
