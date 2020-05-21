class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: :true
    validates :age, numericality: { :greater_than => 0}
    validates :bio, length: { minimum: 30 }

    def total_likes
        total_likes = 0
        posts.each do |post|
            total_likes += post.likes
        end
        total_likes
    end

    def featured_post
        posts.max_by {|p| p.likes}
    end

    def top_5_destinations
        posts.sort_by{|p| p.destination_id}
        
    end

end
