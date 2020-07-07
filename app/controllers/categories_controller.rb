class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @categories = Category.all
    @link_active = "search"
  end

end
