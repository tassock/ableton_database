class AddFieldsToLibrarySong < ActiveRecord::Migration
  def self.up
    rename_column :library_songs, :key, :first_key
    rename_column :library_songs, :major, :first_major
    add_column :library_songs, :second_key, :integer
    add_column :library_songs, :second_major, :boolean
    add_column :library_songs, :file_type, :string
    add_column :library_songs, :volume, :float
    add_column :library_songs, :pitch, :float
    add_column :library_songs, :analysis_date, :date
  end

  def self.down
    remove_column :library_songs, :analysis_date
    remove_column :library_songs, :pitch
    remove_column :library_songs, :volume
    remove_column :library_songs, :file_type
    remove_column :library_songs, :second_major
    remove_column :library_songs, :second_key
    rename_column :library_songs, :first_key, :key
    rename_column :library_songs, :first_major, :major
  end
end
