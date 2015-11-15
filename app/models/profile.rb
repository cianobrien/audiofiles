class Profile < ActiveRecord::Base
  belongs_to :users
  has_many :line_items, dependent: :destroy
  has_many :albums, through: :line_items
  has_many :followships, dependent: :destroy
  validates :profile_picture_url, allow_blank: true, format: {
  	with: %r{\.(gif|jpg|png)\Z}i,
   	message: 'must be a URL for GIF, JPG or PNG image.'
  }

  def get_id(id)
    self.line_items.each do |item|
      if item.album.id == id
        item.id
      end
    end
  end

  def find_followship(usr)
    self.followships.each do |foll|
      if foll.user == usr
        foll
      end
    end
  end

  def num_followers
    self.followships.count
    puts self.followships.count
  end

end
