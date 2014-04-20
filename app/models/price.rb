# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  product_id :integer
#  store_id   :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Price < ActiveRecord::Base
  attr_accessible :price, :product_id, :store_id

  belongs_to :store
  belongs_to :product
end
