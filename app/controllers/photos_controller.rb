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
  def create
    p=Photo.new
    p.image=params.fetch("input_image")
    p.likes_count=0
    p.caption=params.fetch("input_caption")
    p.owner_id=params.fetch("input_owner_id")
    p.save
    #p p.id.to_s+".......new id"
    redirect_to "/photos/#{p.id}"
  end
  def delete
    id=params.fetch(:id)
    Photo.destroy_by(id: id)
    redirect_to "/photos"
    #render({ :template => "photos/index.html.erb" })
  end
end
