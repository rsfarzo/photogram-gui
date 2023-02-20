class UsersController < ApplicationController
  def index
    @users= User.all.order('username asc')
    render({ :template => "users/index.html.erb" })
  end
  def show
    @user= User.where(:username=>params.fetch(:username)).first
    render({ :template => "users/show.html.erb" })
  end
end
