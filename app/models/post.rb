class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbaity?

    @@clickbait_phrases = [    
        /won't believe/i,
        /secret/i,
        /top [0-9]*/i,
        /guess/i
    ]


    def is_clickbaity?
        if @@clickbait_phrases.none? { |bait| bait.match title }
          errors.add(:title, "Not clickbaity enough")
        end
    end
end
