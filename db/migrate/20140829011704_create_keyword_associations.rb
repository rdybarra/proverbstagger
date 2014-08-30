class CreateKeywordAssociations < ActiveRecord::Migration
  def change
    create_table :keyword_associations do |t|
      t.belongs_to :verse
      t.belongs_to :keyword
      t.integer :count

      t.timestamps
    end
  end
end
