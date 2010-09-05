class LibrarySongsController < ApplicationController
  # GET /library_songs
  # GET /library_songs.xml
  def index
    @library_songs = LibrarySong.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @library_songs }
    end
  end

  # GET /library_songs/1
  # GET /library_songs/1.xml
  def show
    @library_song = LibrarySong.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @library_song }
    end
  end

  # GET /library_songs/new
  # GET /library_songs/new.xml
  def new
    @library_song = LibrarySong.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @library_song }
    end
  end

  # GET /library_songs/1/edit
  def edit
    @library_song = LibrarySong.find(params[:id])
  end

  # POST /library_songs
  # POST /library_songs.xml
  def create
    @library_song = LibrarySong.new(params[:library_song])

    respond_to do |format|
      if @library_song.save
        format.html { redirect_to(@library_song, :notice => 'Library song was successfully created.') }
        format.xml  { render :xml => @library_song, :status => :created, :location => @library_song }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @library_song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /library_songs/1
  # PUT /library_songs/1.xml
  def update
    @library_song = LibrarySong.find(params[:id])

    respond_to do |format|
      if @library_song.update_attributes(params[:library_song])
        format.html { redirect_to(@library_song, :notice => 'Library song was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @library_song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /library_songs/1
  # DELETE /library_songs/1.xml
  def destroy
    @library_song = LibrarySong.find(params[:id])
    @library_song.destroy

    respond_to do |format|
      format.html { redirect_to(library_songs_url) }
      format.xml  { head :ok }
    end
  end
end
