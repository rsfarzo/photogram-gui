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
    photo= Photo.where(:id=>params.fetch(:id)).first
    photo.image=params.fetch("input_image")
    photo.caption=params.fetch("input_caption")
    photo.save
    redirect_to "/photos/#{photo.id}"
    #render({ :template => "photos/show.html.erb" })
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
  def new_comment
    pid=params.fetch("input_photo_id")
    uid=params.fetch("input_author_id")
    body=params.fetch("input_body")
    Comment.create(:photo_id => pid, :author_id => uid, :body => body)
    redirect_to "/photos/#{pid}"
  end
end
