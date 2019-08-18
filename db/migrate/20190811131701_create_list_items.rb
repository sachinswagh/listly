class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.string :name, default: ''
      t.boolean :active, default: true
      t.integer :list_id

      t.timestamps
    end

    add_index :list_items, :list_id
  end
end
