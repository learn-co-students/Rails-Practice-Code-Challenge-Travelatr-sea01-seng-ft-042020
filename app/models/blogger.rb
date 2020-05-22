class Blogger < ApplicationRecord
    has_many(:posts)

    validates(:name, :bio, :age, presence: true)
    validates(:name, uniqueness: true)
    validates(:bio, length: {minimum: 30})
    validates(:age, numericality: {only_integer: true, greater_than: 0})

    def post_count
        self.posts.count
    end

    def like_count
        self.posts.sum{|post| post.likes}
    end

    def featured_post
        self.posts.max{|post| post.likes}
    end

    def featured_post_title
        self.featured_post.title
    end

    def featured_post_likes
        self.featured_post.likes
    end
    
end
