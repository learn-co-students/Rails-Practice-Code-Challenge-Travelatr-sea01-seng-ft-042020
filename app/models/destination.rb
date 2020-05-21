class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent
        posts.last(5)
    end

    def featured_post
        posts.max_by {|p| p.likes}
    end

    def average_blogger_age
        unique_names = bloggers.uniq
        avearage_age = unique_names.map {|a| a.age}.sum(0.0) / unique_names.length
        avearage_age
    end

    def number_of_posts
        posts.count
    end
end
