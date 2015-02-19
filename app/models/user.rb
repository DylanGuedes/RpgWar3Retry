class User < ActiveRecord::Base
  has_one :player

  validates :login, length: { maximum: 50, minimum: 5 },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_secure_password
end
