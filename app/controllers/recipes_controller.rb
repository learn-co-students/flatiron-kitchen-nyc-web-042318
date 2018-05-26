class RecipesController < ApplicationController
  before_action :get_recipe, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe= Recipe.create(recipe_params)
    if @recipe.valid?
      redirect_to @recipe
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.valid?
      redirect_to @recipe
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to edit_recipe_path
    end
  end

  def destroy
  end

  private

  def get_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
