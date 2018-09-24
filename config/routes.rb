Rails.application.routes.draw do
  devise_for :users
  resources :colleges do
	resources :branches do
		resources :students 
		end
  end

  resources :students do
 		 collection do
    		get :list_students
  	end
	end

	resources :branches do
		collection do
			get :list_branches
		end
	end

  resources :colleges do
 	  member do
		  get :students
	  end
  end
 
  devise_scope :user do
   root to: "devise/sessions#new"
 end
end
