class AddUuidToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :uuid, :string
  end
end
