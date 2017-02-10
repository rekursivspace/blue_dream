class AddUuidToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :uuid, :string
  end
end
