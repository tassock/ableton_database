# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100907043018) do

  create_table "library_clips", :force => true do |t|
    t.text    "live_id"
    t.integer "song_id"
    t.integer "length"
    t.boolean "loopable"
  end

  create_table "library_songs", :force => true do |t|
    t.text    "artist"
    t.text    "title"
    t.integer "bpm"
    t.integer "key"
    t.boolean "major"
  end

  create_table "params", :force => true do |t|
    t.text    "name"
    t.integer "pattern_id"
    t.text    "step_data"
  end

  create_table "patterns", :force => true do |t|
    t.text    "name"
    t.integer "clip_id"
  end

  create_table "sequence_clips", :force => true do |t|
    t.integer "sequence_id"
    t.integer "clip_id"
    t.integer "track_id"
    t.integer "bar_start"
    t.integer "length"
    t.integer "sequence_song_id"
    t.integer "sequence_song_order"
  end

  create_table "sequence_songs", :force => true do |t|
    t.integer "sequence_id"
    t.integer "song_id"
    t.integer "track_id"
    t.integer "bar_start"
    t.integer "length"
  end

  create_table "sequences", :force => true do |t|
    t.text "name"
  end

end
