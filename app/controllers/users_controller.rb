class UsersController < ApplicationController
   
    #users can sign up
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id
            redirect '/login'
        else
            @error = @user.errors.full_messages
            erb :'users/signup'
        end  
    end

    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do 
        @user = User.find_by(username:params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id  
            redirect '/cocktails'
        else
            @error = "Sorry, Either Username or Password is Incorrect, Please try again."
            erb :'users/login' 
        end
    end

    #user can log out
    get '/logout' do
        session.destroy
        redirect '/'
    end

    get '/mixologybook' do 
        @cocktails = current_user.cocktails.reverse
        erb :'/users/mixologybook'
    end

    get '/pantry' do
        @ingredients = current_user.ingredients.uniq
        erb :'/users/pantry'

    end

end