class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.string :book
      t.integer :chapter
      t.integer :verse
      t.text :text

    end
  end
end
