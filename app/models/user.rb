class User < ApplicationRecord
    before_save { self.email.downcase!}
    validates :name, presence: true, length: { maximum: 50}
    validates :email, presence: true, length: { maximum: 255},
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
 
    has_secure_password
    has_many :spots
    has_many :visits
    has_many :likes,through: :visits, source: :spot
    
    
    def like(other_spot)
        self.visits.find_or_create_by(spot_id: other_spot.id)
    end
    
    def unlike(other_spot)
        visit = self.visits.find_by(spot_id: other_spot.id)
        visit.destroy if visit
    end
    
    def visited?(other_spot)
        self.likes.include?(other_spot)
    end
    
    def feed_spots
        Spot.where(spot_id: self.like_ids)
    end
    
end
