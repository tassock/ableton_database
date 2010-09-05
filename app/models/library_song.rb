class LibrarySong < ActiveRecord::Base
  
  has_many :library_clips, :foreign_key => :song_id
  
  validates_presence_of :artist, :title, :bpm, :key, :major
  
  def name
    "#{artist} - #{title}"
  end
  
end