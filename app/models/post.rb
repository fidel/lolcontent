class Post < ActiveRecord::Base
  attr_accessible :photo, :title, :user_id
end
