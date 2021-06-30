class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 10 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :password, presence: true, length: { maximum: 20 }
end
