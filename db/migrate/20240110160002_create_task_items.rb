class CreateTaskItems < ActiveRecord::Migration[7.1]
  def change
    create_table :task_items do |t|
      t.string :category
      t.text :description
      t.integer :priority
      t.integer :status
      t.string :expires_at
      t.text :annotations

      t.timestamps
    end
  end
end
