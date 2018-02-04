Rails.application.routes.draw do
  scope "/interface" do
    post :take,  to: "interface#take"
    get  :index, to: "interface#index"
  end
end
