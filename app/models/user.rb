class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 10 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :password, presence: true, length: { maximum: 20 }

    def blogtexts
        return Blogtext.where(user_id: self.id)
    end

    has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

end
