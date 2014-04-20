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

class Store < ActiveRecord::Base
	attr_accessible :storeName, :address, :photo
	validates(:storeName, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false})

	belongs_to :user
	has_many :prices
	has_many :products, through: :prices

	has_attached_file :photo
validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
