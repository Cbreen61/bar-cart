class ChangeIngredientsCocktailsToCocktailsIngredients < ActiveRecord::Migration
  def change
    drop_table :ingredients_cocktails
    create_join_table :cocktails, :ingredients do |t|
      t.integer :cocktail_id
      t.integer :ingredient_id
    end
  end
end
