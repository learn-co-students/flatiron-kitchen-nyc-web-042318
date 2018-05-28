class RecipesController < ApplicationController

before_action :get_recipe, only: [:show, :edit, :update, :delete]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to @recipe
  end

  def show
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def delete
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

  def get_recipe
    @recipe = Recipe.find(params[:id])
  end

end
