class AddLoopableToLibraryClip < ActiveRecord::Migration
  def self.up
    add_column :library_clips, :loopable, :boolean
  end

  def self.down
    remove_column :library_clips, :loopable
  end
end
