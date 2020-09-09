class RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    render json: recipes, status: 200
  end

  def show
    recipe = Recipe.find(params[:id])
    if recipe.present?
      render json: recipe, status: 200
    else
      render json: { message: "can not find recipe" }, status: 404
    end
  end
end
