class User < ApplicationRecord
  has_secure_password

  has_many :dogs, foreign_key: :owner

  validates_presence_of :username, :email, :password_digest
end
