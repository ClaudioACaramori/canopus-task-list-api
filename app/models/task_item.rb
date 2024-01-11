class TaskItem < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :category

  enumerize :priority, in: { highest: 1, high: 2, medium: 3, low: 4, lowest: 5 }, scope: :shallow, predicates: true, default: 3

end
