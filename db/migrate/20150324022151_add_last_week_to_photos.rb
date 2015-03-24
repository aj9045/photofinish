class AddLastWeekToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :last_week, :boolean, :default => false
  end
end
