class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.boolean :completed, null: false, default: false
      t.string :owner_email, null: false

      t.timestamps
    end
  end
end
