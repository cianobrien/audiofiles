class LineItem < ActiveRecord::Base
  belongs_to :album
  belongs_to :profile
end
