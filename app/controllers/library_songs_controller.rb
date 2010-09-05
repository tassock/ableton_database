class LibrarySongsController < ApplicationController
  
  def index
    @library_songs = LibrarySong.all
  end
  
  def edit
    @library_song = LibrarySong.find params[:id]
  end
  
  def new
    @library_song = LibrarySong.new
  end
  
end
