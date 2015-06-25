class Picture < ActiveRecord::Base

  validates_presence_of :artist, :title, :url


end
