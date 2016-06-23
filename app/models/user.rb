class User < ActiveRecord::Base
  has_secure_password
  #automatically creates attr accessor for password and password_confirmation
  #encrypts user entered pw into user db table pw_digest field

  has_many :reviews
  has_many :products, through: :reviews

  validates :name, presence: true
end
