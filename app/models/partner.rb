# == Schema Information
#
# Table name: partners
#
#  id         :integer          not null, primary key
#  company    :text
#  activity   :string(255)
#  name       :text
#  phone      :text
#  email      :text
#  url        :text
#  created_at :datetime
#  updated_at :datetime
#

class Partner < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :company, presence: true
end
