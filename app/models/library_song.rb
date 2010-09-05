class LibrarySong < ActiveRecord::Base
  
  def name
    "#{artist} - #{title}"
  end
end
