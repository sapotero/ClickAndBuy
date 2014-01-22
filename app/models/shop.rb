# == Schema Information
#
# Table name: shops
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  desc                :text
#  url                 :string(255)
#  fb                  :string(255)
#  vk                  :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Shop < ActiveRecord::Base
  has_many :items

  has_attached_file :avatar, :styles => { :medium => "600x600>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpg", "image/gif", "image/png"] }
  validates :name, presence: true
end