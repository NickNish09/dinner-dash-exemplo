class AllUsersController < ApplicationController
    before_action :set_user, only: [:destroy, :show, :edit, :update]
    before_action :authenticate_user!
    before_action do 
        redirect_to new_user_session_path unless current_user && current_user.is_admin?  
    end
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user= User.new(user_params)
        if @user.save
            redirect_to all_users_path
        else
            render :new
        end
    end

    def destroy
        @user.destroy
        redirect_to all_users_path
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to all_users_path
        else
            render :edit
        end
    end

    def show
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
