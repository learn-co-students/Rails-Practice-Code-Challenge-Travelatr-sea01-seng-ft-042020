Rails.application.routes.draw do
  resources(:destinations, only:[:index, :show])
  resources(:bloggers, only:[:index, :new, :create, :show])
  resources(:posts, only:[:index, :new, :create, :show, :edit, :update])
  post("/posts/:id/like", to: "posts#add_like")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
