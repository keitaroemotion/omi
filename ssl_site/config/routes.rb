Rails.application.routes.draw do
  get 'endpoint/index'

  scope "/endpoint" do
    post :take,  to: "endpoint#take"
    get  :index, to: "endpoint#index"
  end
end
