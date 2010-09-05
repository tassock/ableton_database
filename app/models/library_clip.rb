class LibraryClip < ActiveRecord::Base
  set_table_name 'clips'
  belongs_to :library_song, :foreign_key => :song_id
  validates_presence_of :song_id, :live_id, :length
end
