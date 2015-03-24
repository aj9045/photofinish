class AddThisWeekToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :this_week, :boolean, :default => true
  end
end
