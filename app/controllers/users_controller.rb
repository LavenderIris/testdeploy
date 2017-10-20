class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save 
          flash[:success] = "You have successfully registered. Please login."
        else 
          flash[:errors]=user.errors.full_messages
        end
        redirect_to '/main'
    end 

    private 
    def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
    end
end
