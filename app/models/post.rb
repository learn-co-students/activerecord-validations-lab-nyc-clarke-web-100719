class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :non_clickbait

    def non_clickbait
        if self.title? && !(self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top [number]") || self.title.include?("Guess"))
            errors.add(:non_clickbait, "Your title must include clickbait worthy phrases!")
        end
    end
end
