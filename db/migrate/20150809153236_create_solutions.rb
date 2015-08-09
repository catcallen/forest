class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_index :solutions, :user_id
  end
end
