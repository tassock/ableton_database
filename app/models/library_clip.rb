class LibraryClip < ActiveRecord::Base
  belongs_to :library_song, :foreign_key => :song_id
  validates_presence_of :song_id, :live_id, :length
  validates_uniqueness_of :live_id
end
