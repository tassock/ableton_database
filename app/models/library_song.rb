class LibrarySong < ActiveRecord::Base
  
  has_many :library_clips, :foreign_key => :song_id
  
  def name
    "#{artist} - #{title}"
  end
  
end