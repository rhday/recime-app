class Post < ActiveRecord::Base

    belongs_to :user

    has_many :likes
    
    validates :title, :image_url, :description, presence: true
    
end
