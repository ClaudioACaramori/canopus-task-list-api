class TaskItem < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :category

  enumerize :priority, in: { highest: 1, high: 2, medium: 3, low: 4, lowest: 5 }, scope: :shallow, predicates: true
  enumerize :status, in: { waiting: 1, active: 2, done: 3 }, scope: :shallow, predicates: true, default: 1

  before_save :ensure_priority

  private

  def ensure_priority
    priority ||= category.priority.value

    assign_attributes(priority: priority)
  end

end
