class CreateSongTags < ActiveRecord::Migration
  def self.up
    create_table :song_tags do |t|
      t.string :name
      t.integer :library_song_id

      t.timestamps
    end
  end

  def self.down
    drop_table :song_tags
  end
end
