require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Pineapple, is the answer"
    set :method_override, true

    
  end

  get "/" do
    erb :welcome
  end
  def logged_in?
    !!User.find_by(id: session[:user_id])
  end

end
