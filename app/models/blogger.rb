class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def max_likes 
        max_likes = 0   
        self.posts.each do |post|   
            if post.likes > max_likes
                max_likes = post.likes
                return post.title
            end 
        end   
    end

        
end
