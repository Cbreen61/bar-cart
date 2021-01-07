class CocktailsController < ApplicationController

    #create /post
    #New
    #make a get request to '/cocktails/new'
    get '/cocktails/new' do 
        erb :'/cocktails/new'
    
    end

    #Create
    #make a post request to '/cocktails'
    post '/cocktails' do
        cocktail = Cocktail.new(params)
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
        @cocktails = Cocktail.all.reverse
        erb :'cocktails/index'
    end

    #show- specific cocktail
    #make a get request to '/cocktails/:id'
    get '/cocktails/:id' do
        @cocktail = Cocktail.find(params["id"])
        erb :'/cocktails/show'
    end



    #update /put
    #Edit Form
    #make a get request to '/cocktails/:id/edit'
    get '/cocktails/:id/edit' do 
       @cocktail = Cocktail.find(params["id"])
        erb :'/cocktails/edit'
    end

    #Update 
    #make a patch request to '/cocktails/:id'


    #destroy /delete
    #make a delete request to '/cocktails/:id'




end