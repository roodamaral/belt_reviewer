class UsersController < ApplicationController


  def new
  end

  def show
  end

  def edit
  end

  def create
	@user = User.new(first_name:params['first_name'], last_name:params['last_name'], email:params['email'], location:params['location'], state:params['state'], password:params['password'], password_confirmation:params['password_confirmation'])
		if @user.save
		    flash[:errors] = ['User successfully created, Now Login']
		    redirect_to '/'
	  	else
	  		flash[:errors] = @user.errors.full_messages
	  		redirect_to '/'
	  	end
  end
  
  def update
  		if current_user.update(first_name:params['first_name'], last_name:params['last_name'], email:params['email'], location:params['location'], state:params['state'], password:params['password'], password_confirmation:params['password_confirmation'])
			  flash[:notice] = ['User successfully updated']
		    redirect_to '/users/'+current_user.id.to_s
	  	else
	  		flash[:errors] = current_user.errors.full_messages
	  		redirect_to '/users/'+current_user.id.to_s + '/edit'
	  	end

  end 

  def destroy 
  	User.destroy(current_user.id)
  	session[:user_id] = nil
  	redirect_to '/users/new'
  end


end
