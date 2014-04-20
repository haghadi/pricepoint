class AddAttachmentPhotoToStores < ActiveRecord::Migration
  def self.up
    change_table :stores do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :stores, :photo
  end
end
