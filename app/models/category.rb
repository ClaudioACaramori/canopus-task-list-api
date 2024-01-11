class Category < ApplicationRecord
  extend Enumerize

  has_many :tasks

  enumerize :priority, in: { highest: 1, high: 2, medium: 3, low: 4, lowest: 5 }, scope: :shallow, predicates: true, default: 3

end
