class PhotosController < ApplicationController
  def index
    @photos= Photo.all.order('created_at asc')
    render({ :template => "photos/index.html.erb" })
  end
  def show
    @photo= Photo.where(:id=>params.fetch(:id)).first
    render({ :template => "photos/show.html.erb" })
  end
  def update
    @photo= Photo.where(:id=>params.fetch(:id)).first
    render({ :template => "photos/show.html.erb" })
  end
end
