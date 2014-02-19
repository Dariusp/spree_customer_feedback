Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  get "/feedback/:hash", :to => "feedbacks#index", :as => :feedback
  post "/feedback/",      :to => "feedbacks#update", :as => :feedback_update
end
