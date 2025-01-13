class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :original_url, null: false
      t.string :short_url, null: false
      t.timestamps
    end
    add_index :links, :short_url, unique: true
  end
end
