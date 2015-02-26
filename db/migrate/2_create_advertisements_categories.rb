class CreateAdvertisementsCategories < ActiveRecord::Migration

  def up
    create_table :refinery_advertisements_categories do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-advertisements"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/advertisements/categories"})
    end

    drop_table :refinery_advertisements_categories

  end

end
