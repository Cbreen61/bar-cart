class IngredientsController < ApplicationController
    before do
        require_login 
    end

    get "/ingredients" do 
        @ingredients = Ingredient.all.reverse
        erb :'/ingredients/index'
    end


end