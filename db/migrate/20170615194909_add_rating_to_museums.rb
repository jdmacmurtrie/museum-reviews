class AddRatingToMuseums < ActiveRecord::Migration[5.1]
  def change
    add_column :museums, :rating, :integer
  end
end
