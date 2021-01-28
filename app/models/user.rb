class User < ActiveRecord::Base
    has_many :notes
    has_secure_password

    # Validations - NOT REQUIRED OR TAUGHT IN THIS PHASE
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end