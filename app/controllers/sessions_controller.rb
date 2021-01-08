class SessionsController < ApplicationController
    #user can log in 
    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do 
        if params["username"].empty? || params["password"].empty?
            @error = "Username and Password can''t be empty"
            erb :'users/login' 

        else
            if user = User.find_by(username: params["username"], password: params["password"])
                session[:user_id] = user.id
                redirect '/cocktails'
            else
                @error = "Account can not be found"
                erb :'users/login'
            end
        end
            

    end

    #user can log out
    get '/logout' do
        session.clear
        redirect '/'
    end


end