class Photo < ActiveRecord::Base
  belongs_to :albums
  dragonfly_accessor :image
end
