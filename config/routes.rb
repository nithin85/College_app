Rails.application.routes.draw do
 	root 'colleges#index'
		
  
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

   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
