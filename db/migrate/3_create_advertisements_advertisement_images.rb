class CreateAdvertisementsAdvertisementImages < ActiveRecord::Migration

  def up
    create_table :refinery_advertisements_images do |t|
      t.integer :advertisement_id
      t.integer :position

      t.string   :image_name
      t.integer  :image_size
      t.string   :image_ext
      t.string   :image_uid
      t.string   :image_mime_type
      t.integer  :image_id

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-advertisements"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/advertisements/advertisement_images"})
    end

    drop_table :refinery_advertisements_images

  end

end
