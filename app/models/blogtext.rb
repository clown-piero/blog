class Blogtext < ApplicationRecord
    validates :title,  presence: true, length: { maximum: 20 }
    validates :content, presence: true, length: { maximum: 500 }


    def user
        return User.find_by(id: self.user_id)
    end
end
