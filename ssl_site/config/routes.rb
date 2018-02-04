Rails.application.routes.draw do
  get 'endpoint/index'

  scope "/interface" do
    post :take,  to: "interface#take"
    get  :index, to: "interface#index"
  end

  scope "/endpoint" do
    post :take,  to: "endpoint#take"
    get  :index, to: "endpoint#index"
  end
end
