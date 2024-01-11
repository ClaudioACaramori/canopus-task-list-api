class AddCategoryToTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :task_items, :category, foreign_key: true
  end
end
