class IngredientsController < ApplicationController
  before_action :get_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.valid?
      redirect_to @ingredient
    else
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to new_ingredient_page
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to @ingredient
  end

  def destroy
  end

  private

  def get_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
