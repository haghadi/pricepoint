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

require 'spec_helper'

describe Price do
  pending "add some examples to (or delete) #{__FILE__}"
end
