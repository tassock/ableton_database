class SongTag < ActiveRecord::Base
  belongs_to :library_song
  validates_uniqueness_of :library_song_id, :scope => :name
end
