# == Schema Information
#
# Table name: discounts
#
#  id         :integer          not null, primary key
#  discount   :integer
#  item_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  likes      :integer
#  count      :integer
#  active     :boolean
#

class Discount < ActiveRecord::Base
  has_many :items

  validates :discount, :numericality => { :greater_than => 0 }
  validates :likes,    :numericality => { :greater_than => 0 }
  validates :count,    :numericality => { :greater_than => 0 }
end
