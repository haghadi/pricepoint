# == Schema Information
#
# Table name: stores
#
#  id                 :integer          not null, primary key
#  storeName          :string(255)
#  address            :string(255)
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'spec_helper'

describe Store do
  pending "add some examples to (or delete) #{__FILE__}"
end
