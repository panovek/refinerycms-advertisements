class CreateAdvertisementsAdvertisements < ActiveRecord::Migration

  def up
    create_table :refinery_advertisements do |t|
      t.string :title
      t.text :body
      t.date :expiry_date
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-advertisements"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/advertisements/advertisements"})
    end

    drop_table :refinery_advertisements

  end

end
