class CreateTableToys < ActiveRecord::Migration
  def up
    create_table :toys do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :toys
  end
end
