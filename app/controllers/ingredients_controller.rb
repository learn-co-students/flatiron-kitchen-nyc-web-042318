class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :edit, :update]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.valid?
      redirect_to @ingredient
    else
      redirect_to new_ingredient_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    if @ingredient.valid?
      redirect_to @ingredient
    else
      redirect_to edit_ingredient_path
    end
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :recipe_id)
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end
