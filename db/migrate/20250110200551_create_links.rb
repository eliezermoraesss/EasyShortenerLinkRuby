class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :original_url, null: false  # URL original não pode ser vazia
      t.string :short_url, null: false     # URL curta não pode ser vazia
      t.timestamps                         # Cria created_at e updated_at
    end
    add_index :links, :short_url, unique: true  # Índice único para URLs curtas
  end
end