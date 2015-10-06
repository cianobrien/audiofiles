class Album < ActiveRecord::Base
validates :name, :artist, :tracks, :year, :image_url, presence: true
validates :name, uniqueness: { scope: :artist, message: "This album has already been entered" }
validates :year, numericality: { greater_than_or_equal_to: 1900 }
validates :year, numericality: { less_than_or_equal_to: 2015 }
validates :image_url, allow_blank: true, format: {
  with: %r{\.(gif|jpg|png)\Z}i,
  message: 'must be a URL for GIF, JPG or PNG image.'
}
end
