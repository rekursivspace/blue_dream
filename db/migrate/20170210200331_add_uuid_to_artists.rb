class AddUuidToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :uuid, :string
  end
end
