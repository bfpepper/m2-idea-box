module Admin
  class CategoriesController < BaseController

    def new
      @category = Category.new
    end

    def create
      category = Categoy.new(category_params)
      if category.save
        flash[:success] = "#{cateogry.title} has been created!"
      else
        render :new
      end
    end

    def destroy
      category = Category.find(params[:id])
      flass[:success] = "#{cateogry.title} has been deleted!"
      category.destroy
      
    end

    private

    def category_params
      params.require(:category).permit(:title)
    end
  end
end
