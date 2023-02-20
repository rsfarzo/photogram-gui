Rails.application.routes.draw do

  root to: "users#index"
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id", { :controller => "photos", :action => "show" })
  get("/update_photo/:id",{ :controller=>"photos", :action=>"update"})
  get("/insert_user_record", {:controller=>"users",:action=>"new"})
  get("/update_user_record/:username", {:controller=>"users",:action=>"update"})
  get("/insert_photo_record", {:controller=>"photos",:action=>"create"})
  get("/delete_photo/:id",{:controller=>"photos",:action=>"delete"})
  get("/insert_comment_record", {:controller=>"photos",:action=>"new_comment"})
end
