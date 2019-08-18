class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name, default: ''
      t.text :description, default: ''
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
