class RegistrationsController < Devise::RegistrationsController

	def create 
		build_resource

		if resource.save
			sign_in(resource_name, resource)
			ajax = render :json => {:success => true, :content => render_to_string(:layout => false, :partial => 'devise/manager')} 
			return ajax
			#respond_with resource, :location => after_sign_up_path_for(resource)

		else
      		clean_up_passwords resource
			ajax = render :json => {:success => true, :content => render_to_string(:layout => false, :partial => 'devise/manager')} 
			return ajax
			#respond_with resource
    	end
    end
end