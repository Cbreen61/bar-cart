class UsersController < ApplicationController
   
    #users can sign up
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Username and Password are invalid"
            erb :'users/signup' 
            
        elsif User.find_by(username: user.username)
            @error = "Account with that username is already in use"
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect '/cocktails'
        end
    
    
    end



    #users can delet account 

end