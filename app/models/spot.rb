class Spot < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    
    validates :prefecture, presence: true
    validates :city, presence: true
    validates :name, presence: true, length: {maximum:30}
    validates :content, presence: true, length: { maximum: 255}
   
    
    has_many :reverses_of_visits,class_name: 'Visit',foreign_key:'user_id'
    has_many :liked, through: :reverses_of_visits, source: :user
    
      def self.search(search)
        return Spot.all unless search
        Spot.where(['CONCAT(name,prefecture) Like?',"%#{search}%"])

      end
end
