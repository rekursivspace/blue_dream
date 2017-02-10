class AddUuidToLabels < ActiveRecord::Migration[5.0]
  def change
    add_column :labels, :uuid, :string
  end
end
