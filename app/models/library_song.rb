require "rubygems"
require "nokogiri"

class LibrarySong < ActiveRecord::Base
  
  has_many :library_clips, :foreign_key => :song_id
  has_many :song_tags
  
  validates_presence_of :artist, :title, :bpm, :first_key
  validates_uniqueness_of :title, :scope => :artist
  
  def name
    "#{artist} - #{title}"
  end
  
  def first_camelot_key=( value )
    puts "first_camelot_key: #{value}"
    if value
      self.first_key = value.to_i
      self.first_major = value.include?('A') ? false : true
    end
  end
  
  def second_camelot_key=( value )
    if value
      self.second_key = value.content.to_i
      self.second_major = value.content.include?('A') ? false : true
    end
  end
  
  def title=(title)
    if title
      write_attribute(:title, title.gsub('.wav', '').gsub('.mp3', '').gsub('.aif', ''))
    end
  end
  
  def self.import
    doc = Nokogiri::HTML(open("#{Rails.root}/collection.xml"))
    doc.css('song').each do |song|
      file_name = File.basename(song.css('path').first.content).gsub('%20', ' ')
      artist = file_name.split(' - ')[0]
      title  = file_name.split(' - ')[1]
      lib_song = LibrarySong.new(
        :artist => artist,
        :title  => title,
        :bpm    => song.css('tempo').first.content,
        :pitch  => song.css('pitch').first.content,
        :volume => song.css('volume').first.content,
        :first_camelot_key =>  song.css('first_key').first.content,
        :second_camelot_key => song.css('second_key').first,
        :file_type => File.extname(file_name).gsub('.', ''),
        :analysis_date => Date.parse( song.css('analysis_date').first.content )
      )
      unless lib_song.save
        "UNSAVED: #{lib_song.inspect}"
        lib_song = LibrarySong.find_by_artist_and_title(artist, title)
      end
      puts lib_song.inspect
      # Create tags
      song.css('tag').each do |tag|
        tag = SongTag.create(:library_song => lib_song, :name => tag.content)
        puts tag.inspect
      end
    end
  end
  
end