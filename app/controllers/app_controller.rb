class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :login
  end

  post '/login' do
    if User.find_by(username: params[:username])
      params[:message] = "That Username Is Already Taken."
      erb :create_account
    elsif params[:password] != params[:rePassword]
      params[:message] = "Your passwords do not match"
      erb :create_account
    elsif
      params[:success] = "Your account was created successfuly. Use the form below to login."
      User.create(:username => params[:username], :password => params[:password])
      erb :login
    end 
  end 

  post '/logged_in' do
    user = User.find_by(username: params[:username])
    if user.password = params[:password]
      session["username"] = params[:username]
      session[:id] = user.id
      session[:status] = "logged in"
      @session = session
      erb :profile
    else
      params[:message] = "We could not find that acount password combination. Please check your cridentials and try again."
      erb :login
    end
  end 

  get '/create_account' do
    erb :create_account
  end

  post '/create_account' do
    if User.find_by(username: params[:username])
      params[:message] = "That Username Is Already Taken."
      erb :create_account
    elsif params[:password] != params[:rePassword]
      params[:message] = "Your passwords do not match"
      erb :create_account
    elsif
      params[:success] = "Your account was created successfuly. Use the form below to login."
      User.create(:username => params[:username], :password => params[:password])
      erb :login
    end
  end 

  get '/create_post' do 
    erb :create_post
  end 

  post '/create_post' do
    if session[:status] == "logged in"
      newPost = Post.create(:user_id => session[:id], :content => params[:content])
      params[:message] = "Post was created succesfuly"
    else
      erb :login
    end 
  end

  get '/edit_post/:post_id' do
    @post = Post.find_by(id: params[:post_id])
    if @post.user_id == session[:id]
      @post.content
      erb :edit_post
    else
      erb :sorry
    end 
  end

  post '/edit_post/:post_id' do
    @post = Post.find_by(id: params[:post_id])
    @post.update(:content => params[:content])
    erb :profile
  end 

  get '/delete_post/:post_id' do
    @post = Post.find_by(id: params[:post_id])
    if @post.user_id == session[:id]
      @post.destroy
      erb :profile
    else
      erb :sorry
    end
  end 

  get '/logout' do 
    session.clear
    erb :login
  end 

  get '/post/:post_id' do
    if Post.exists?(id: params[:post_id])
      @post = Post.find(params[:post_id].to_i)
      if User.exists?(id: @post.user_id.to_i)
        @user = User.find(@post.user_id.to_i).username
      else
        @user = "@UserNotFound"
      end
      erb :post
    else
      erb :sorry
    end 
  end 

  get '/profile' do
    erb :profile
  end 
end
