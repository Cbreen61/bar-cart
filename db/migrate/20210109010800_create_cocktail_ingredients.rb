class CreateCocktailIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients_cocktails do |t|
      t.integer :cocktail_id
      t.integer :ingredient_id
    end
  end
end
