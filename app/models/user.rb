class User < ApplicationRecord
  include TokenAuthenticatable
  extend Enumerize

  has_many :task_items

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enumerize :profile, in: { admin: 0, user: 1 }, scope: :shallow, predicates: true, default: 1
end
