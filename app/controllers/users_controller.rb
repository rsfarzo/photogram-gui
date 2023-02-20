class UsersController < ApplicationController
  def index
    @users= User.all.order('username asc')
    render({ :template => "users/index.html.erb" })
  end
  def show
    @user= User.where(:username=>params.fetch(:username)).first
    render({ :template => "users/show.html.erb" })
  end
  def new
    username=params.fetch("input_username");
    @user=User.create(username: username)
    redirect_to "/users/#{username}"
    #render({ :template => "users/show.html.erb" })
  end
  def update
    username=params.fetch("username");
    @user=User.where(:username=>username);
    new_username=params.fetch("input_username")
    User.update(:username => new_username)
    p username+"->"+new_username+"......................."
    redirect_to "/users/#{new_username}"
    #render({ :template => "users/show.html.erb" })
  end 
end
