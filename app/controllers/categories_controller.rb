class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  private

  def search
  end
end
