class AddDefaultToCocktailImage < ActiveRecord::Migration
  def change
    change_column_default :cocktails, :image, 'https://images.pexels.com/photos/1283219/pexels-photo-1283219.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
  end
end
