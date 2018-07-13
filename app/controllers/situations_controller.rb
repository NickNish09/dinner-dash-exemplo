class SituationsController < ApplicationController
    before_action :set_situation, only: [:destroy, :show, :edit, :update]
    before_action :authenticate_user!
    before_action do 
        redirect_to new_user_session_path unless current_user && current_user.is_admin?  
    end
    def index
        @situations = Situation.all
    end

    def new
        @situation = Situation.new
    end

    def create
        @situation= Situation.new(situation_params)
        if @situation.save
            redirect_to situations_path
        else
            render :new
        end
    end

    def destroy
        @situation.destroy
        redirect_to situations_path
    end

    def edit
    end

    def update
        if @situation.update(situation_params)
            redirect_to situations_path
        else
            render :edit
        end
    end

    def show
    end

    private

    def set_situation
        @situation = Situation.find(params[:id])
    end

    def situation_params
        params.require(:situation).permit(:description)
    end
end
