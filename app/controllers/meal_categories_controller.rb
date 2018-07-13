class MealCategoriesController < ApplicationController
    before_action :set_meal_category, only: [:destroy, :show, :edit, :update]
    before_action :authenticate_user!
    before_action do 
        redirect_to new_user_session_path unless current_user && current_user.is_admin?  
    end
    def index
        @meal_categories = MealCategory.all
    end

    def new
        @meal_category = MealCategory.new
    end

    def create
        @meal_category= MealCategory.new(meal_category_params)
        if @meal_category.save
            redirect_to meal_categories_path
        else
            render :new
        end
    end

    def destroy
        @meal_category.destroy
        redirect_to meal_categories_path
    end

    def edit
    end

    def update
        if @meal_category.update(meal_category_params)
            redirect_to meal_categories_path
        else
            render :edit
        end
    end

    def show
    end

    private

    def set_meal_category
        @meal_category = MealCategory.find(params[:id])
    end

    def meal_category_params
        params.require(:meal_category).permit(:name)
    end
end
