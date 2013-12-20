class CreateTableDogs < ActiveRecord::Migration
  def up
    create_table :dogs do |t|
      t.string :name
      t.string :breed

      t.timestamps
    end
  end

  def down
    drop_table :dogs
  end
end
