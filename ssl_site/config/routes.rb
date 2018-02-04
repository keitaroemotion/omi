Rails.application.routes.draw do
  get 'endpoint/index'

  scope "/endpoint" do
    post :get_request,  to: "endpoint#get_request"
    get  :index, to: "endpoint#index"
  end
end
