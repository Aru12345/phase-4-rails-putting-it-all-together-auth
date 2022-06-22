class RecipesController < ApplicationController
   
    def index
        user = User.find_by(id: session[:user_id])
        if user
            recipe=Recipe.all 
            render json: recipe
        else
            render json: { errors: ["User not logged in"]}, status: :unauthorized
        end
       
    end
    def create
    
    recipe=@currentuser.recipes.create!(recipe_params)
    render json: recipe ,status: :created


    end

  
    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
      
    end
end
