class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update]
  before_action :get_ingredients, only: [:new, :edit]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      redirect_to @recipe
    else
      redirect_to new_recipe_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.valid?
      redirect_to @recipe
    else
      redirect_to edit_recipe_path
    end
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def get_ingredients
    @ingredients = Ingredient.all
  end

end
