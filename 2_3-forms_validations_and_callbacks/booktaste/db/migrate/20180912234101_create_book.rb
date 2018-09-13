class CreateBook < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, limit: 255
      t.string :preview
      t.string :description
      t.string :author, limit: 50
      t.string :publisher
      t.integer :year
    end

    add_index :books, :title, unique: true
  end
end
