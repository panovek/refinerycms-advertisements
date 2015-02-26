class CreateAdvertisementsAdvertisementImages < ActiveRecord::Migration

  def up
    create_table :refinery_advertisements_advertisement_images do |t|
      t.integer :image_id
      t.integer :advertisement_id
      t.integer :position

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

    drop_table :refinery_advertisements_advertisement_images

  end

end
