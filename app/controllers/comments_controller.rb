class CommentsController < ApplicationController
  before_action :set_recipe
  
  def create
    unless current_user
      flash[:danger] = "Please register or sign in to post comments."
      redirect_to "/register.html"
    else
      @comment = @recipe.comments.build(comment_params)
      @comment.chef = current_user
      
      if @comment.save
        flash[:success] = "Your comment was added."
      else
        flash[:danger] = "Comment was not added, please try again."
      end
      
      redirect_to recipe_path(@recipe)
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
end
