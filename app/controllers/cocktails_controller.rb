class CocktailsController < ApplicationController

    #create /post
    #New
    #make a get request to '/cocktails/new'

    #Create
    #make a post request to '/cocktails'


    #read /get 
    #index -all
    #make a get request to '/cocktails'
    get '/cocktails' do 
        @cocktails = Cocktail.all
        erb :'cocktails/index'
    end

    #show- specific cocktail
    #make a get request to '/cocktails/:id'
    get '/cocktails/:id' do
        @cocktail = Cocktail.find(the recipe id)
        erb :'/cocktails/show'
    end



    #update /put
    #Edit Form
    #make a get request to '/cocktails/:id/edit'

    #Update 
    #make a patch request to '/cocktails/:id'


    #destroy /delete
    #make a delete request to '/cocktails/:id'




end