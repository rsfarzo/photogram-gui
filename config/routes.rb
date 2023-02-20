Rails.application.routes.draw do

  root to: "users#index"
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id", { :controller => "photos", :action => "show" })
  post("/update_photo/:id",{ :controller=>"photos", :action=>"update"})
end
