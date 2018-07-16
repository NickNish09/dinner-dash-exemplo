class MealsController < ApplicationController
    before_action :set_meal, only: [:destroy, :show, :edit, :update]
    before_action :authenticate_user!
    
    def index
        @meals = Meal.all
    end

    def new
        @meal = Meal.new
    end

    def create
        @meal= Meal.new(meal_params)
        if @meal.save
            redirect_to meals_path
        else
            render :new
        end
    end

    def destroy
        @meal.destroy
        redirect_to meals_path
    end

    def edit
    end

    def update
        if @meal.update(meal_params)
            redirect_to meals_path
        else
            render :edit
        end
    end

    def show
    end

    private

    def set_meal
        @meal = Meal.find(params[:id])
    end

    def meal_params
        params.require(:meal).permit(:name, :description, :price, :image, :meal_category_id)
    end
end
