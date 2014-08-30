class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.text :value

      t.belongs_to :verse

      t.timestamps
    end
  end
end
