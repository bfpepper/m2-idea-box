module Admin
  class CategoriesController < Admin::BaseController

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        # flash[:success] = "#{@category.title} has been created!"
        redirect_to admin_dashboard_index_path
      else
        render :new
      end
    end

    def destroy
      @category = Category.find(params[:id])
      flass[:success] = "#{@category.title} has been deleted!"
      category.destroy
    end

    private

    def category_params
      params.require(:category).permit(:title)
    end
  end
end
