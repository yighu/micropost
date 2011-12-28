class CreateMcroposts < ActiveRecord::Migration
  def change
    create_table :mcroposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
