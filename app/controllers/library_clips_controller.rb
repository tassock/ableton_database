class LibraryClipsController < ApplicationController
  # GET /library_clips
  # GET /library_clips.xml
  def index
    @library_clips = LibraryClip.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @library_clips }
    end
  end

  # GET /library_clips/1
  # GET /library_clips/1.xml
  def show
    @library_clip = LibraryClip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @library_clip }
    end
  end

  # GET /library_clips/new
  # GET /library_clips/new.xml
  def new
    @library_clip = LibraryClip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @library_clip }
    end
  end

  # GET /library_clips/1/edit
  def edit
    @library_clip = LibraryClip.find(params[:id])
  end

  # POST /library_clips
  # POST /library_clips.xml
  def create
    @library_clip = LibraryClip.new(params[:library_clip])

    respond_to do |format|
      if @library_clip.save
        format.html { redirect_to(@library_clip, :notice => 'Library clip was successfully created.') }
        format.xml  { render :xml => @library_clip, :status => :created, :location => @library_clip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @library_clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /library_clips/1
  # PUT /library_clips/1.xml
  def update
    @library_clip = LibraryClip.find(params[:id])

    respond_to do |format|
      if @library_clip.update_attributes(params[:library_clip])
        format.html { redirect_to(@library_clip, :notice => 'Library clip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @library_clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /library_clips/1
  # DELETE /library_clips/1.xml
  def destroy
    @library_clip = LibraryClip.find(params[:id])
    @library_clip.destroy

    respond_to do |format|
      format.html { redirect_to(library_clips_url) }
      format.xml  { head :ok }
    end
  end
end
