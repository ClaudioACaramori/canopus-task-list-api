class User < ApplicationRecord
  extend Enumerize

  has_many :tasks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enumerize :profile, in: [:admin, :user], default: :user
end
