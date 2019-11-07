class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fictiyyyon Non-Fiction) }
    validate :non_clickbait 

    # def non_clickbait
    #     if self.title && !(self.title.include?("Won't Believe") ||  self.title.include?("Secret") || self.title.include?("Top") || self.title.include?("Guess"))
    #         errors.add(:title, "must be clickbait-y")
    #     end
    # end

end
