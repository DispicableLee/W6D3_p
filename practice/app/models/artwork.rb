# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    
    belongs_to :artist,
        class_name: 'User',
        foreign_key: :artist_id,
        inverse_of: :artworks
        
    has_many :comments,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :artworks_for_user_id,
        through: :artist,
        source: :artworks
    
    
    has_many :artwork_shares,
        class_name: 'ArtworkShare',
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer


    


        
end
