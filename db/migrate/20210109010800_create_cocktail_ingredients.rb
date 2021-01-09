class CreateCocktailIngredients < ActiveRecord::Migration
  def change
    create_table :cocktails_ingredients do |t|
      t.integer :cocktail_id
      t.integer :ingredient_id
    end
  end
end
