class Destination < ApplicationRecord
    has_many(:posts)

    validates(:name, :country, presence: true)
    validates(:name, uniqueness: true)

    def location_name
        self.name + ", " + self.country
    end

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

    def latest_posts(num)
        self.posts.order(:updated_at).limit(num)
    end

end
