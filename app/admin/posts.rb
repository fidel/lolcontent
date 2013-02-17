ActiveAdmin.register Post do

  scope :all, default: true
  scope :waiting
  scope :published

  show do |post|
    attributes_table do
      row :title
      row :photo do
        image_tag(post.photo_url(:normal))
      end
      row :published
    end
    active_admin_comments
  end
end
