class LibraryClip < ActiveRecord::Base
  set_table_name 'clips'
  belongs_to :library_song, :foreign_key => :song_id
end
