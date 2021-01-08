class CocktailsController < ApplicationController

    #create /post
    #New
    #make a get request to '/cocktails/new'
    get '/cocktails/new' do 
       if logged_in?
         erb :'/cocktails/new'
        else
            redirect'/login'
        end
    
    end

    #Create
    #make a post request to '/cocktails'
    post '/cocktails' do
        cocktail = current_user.cocktails.build(params)
        if !cocktail.title.empty? && !cocktail.method.empty?
            cocktail.save
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
        
        if logged_in?
        
            @cocktails = Cocktail.all.reverse
            erb :'cocktails/index'
        else
            redirect'/login'
        end
       
    end

    #show- specific cocktail
    #make a get request to '/cocktails/:id'
    get '/cocktails/:id' do
        if logged_in?
         @cocktail = Cocktail.find(params[:id])
            erb :'/cocktails/show'
        else
            redirect'/login'
        end
    end



    #update /put
    #Edit Form
    #make a get request to '/cocktails/:id/edit'
    get '/cocktails/:id/edit' do 
       if logged_in?
            @cocktail = Cocktail.find(params[:id])
            erb :'/cocktails/edit'
        else
            redirect'/login'
        end
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