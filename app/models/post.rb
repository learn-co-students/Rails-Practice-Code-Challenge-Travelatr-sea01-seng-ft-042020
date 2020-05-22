class Post < ApplicationRecord
    belongs_to(:blogger)
    belongs_to(:destination)

    validates(:title, :content, presence: true)
    validates(:content, length: {minimum: 100})

    def add_like
        self.likes += 1
        self.save
    end

    def blogger_name
        self.blogger.name
    end

    def destination_location_name
        self.destination.name + ", " + self.destination.country
    end
    
end
