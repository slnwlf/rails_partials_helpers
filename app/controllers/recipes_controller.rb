class RecipesController < ApplicationController
  before_filter :set_recipe, except: [:index, :new, :create]
  before_filter :authorize, except: [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Successfully created recipe."
      redirect_to "/recipes/#{@recipe.id}"
    else
      flash[:error] = @recipe.errors.full_messages.join(", ")
      redirect_to "/recipes/new"
    end
  end

  def show
  end

  def edit
    # don't let current_user see another user's recipe edit view
    unless current_user == @recipe.user
      redirect_to "/users/#{current_user.id}"
    end
  end

  def update
    # only let current_user update their own recipes
    if current_user == @recipe.user
      if @recipe.update_attributes(recipe_params)
        flash[:notice] = "Successfully updated recipe."
        redirect_to "/recipes/#{@recipe.id}"
      else
        flash[:error] = @recipe.errors.full_messages.join(", ")
        redirect_to "/recipes/#{@recipe.id}/edit"
      end
    else
      redirect_to "/users/#{current_user.id}"
    end
  end

  def destroy
    # only let current_user delete their own recipes
    if current_user == @recipe.user
      @recipe.destroy
      flash[:notice] = "Successfully deleted recipe."
    end
    redirect_to "/users/#{current_user.id}"
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :instructions)
    end

    def set_recipe
      recipe_id = params[:id]
      @recipe = Recipe.find_by_id(recipe_id)
    end

end