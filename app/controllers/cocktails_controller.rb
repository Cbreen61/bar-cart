class CocktailsController < ApplicationController

    before do
        require_login 
    end

    #create /post
    #New
    #make a get request to '/cocktails/new'
    get '/cocktails/new' do
        @ingredients = Ingredient.all
        erb :'/cocktails/new'
    end

    #Create
    #make a post request to '/cocktails'
    post '/cocktails' do
        filtered_params = params
        filtered_params["cocktail"] = params["cocktail"].reject{|key, value| key == "image" && value.empty?}
        filtered_params["cocktail"]["method"] = filtered_params["cocktail"]["method"].gsub("\r\n", "<br/>")
        cocktail = current_user.cocktails.build(filtered_params["cocktail"])
        if ingredient = Ingredient.find_by(name: filtered_params["ingredient"]["name"])
            cocktail.ingredients << ingredient
        else
            cocktail.ingredients.build(filtered_params["ingredient"])
        end
        cocktail.image = nil if cocktail.image.empty?
        if cocktail.save
            redirect '/cocktails'
        
        else
            @error = "Missing data. Please try again"
            erb :'/cocktails/new'
        end
    end 


    #read /get 
    #index -all
    #make a get request to '/cocktails'
    get '/cocktails' do 
        @cocktails = Cocktail.all.reverse
        erb :'cocktails/index'
        
       
    end

    #show- specific cocktail
    #make a get request to '/cocktails/:id'
    get '/cocktails/:id' do
        @cocktail = Cocktail.find_by(id: params[:id])
        if @cocktail
            erb :'/cocktails/show'
        else 
            redirect '/cocktails'
        
        end
    end



    #update /put
    #Edit Form
    #make a get request to '/cocktails/:id/edit'
    get '/cocktails/:id/edit' do
        @cocktail = Cocktail.find(params[:id])
        erb :'/cocktails/edit'
    end

    #Update 
    #make a patch request to '/cocktails/:id'

    patch '/cocktails/:id' do 
        @cocktail = Cocktail.find(params[:id])
        if !params["cocktail"]["title"].empty? && !params["cocktail"]["method"].empty?
            @cocktail.update(params["cocktail"])
            redirect "/cocktails/#{params[:id]}"

        else
            @error = "Data not vaild, Please try again."
            erb :'/cocktails/edit'
        end
    
    end 


    #destroy /delete
    #make a delete request to '/cocktails/:id'
    delete '/cocktails/:id' do
        cocktail = Cocktail.find(params[:id])
        cocktail.destroy
        redirect '/cocktails'
    end




end