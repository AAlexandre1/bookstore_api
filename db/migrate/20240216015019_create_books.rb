class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.references :publisher, null: false, foreign_key: true
      t.date :publication_date
      t.integer :isbn

      t.timestamps
    end
  end
end
