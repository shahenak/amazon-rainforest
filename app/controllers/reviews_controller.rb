class ReviewsController < ApplicationController

before_action :ensure_logged_in, only: [:create, :destroy]
before_action :load_product
before_action :find_review, only: [:show, :edit, :update, :destroy]

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    puts @product.id.to_s + "*****************"
    @review.user = current_user
    if @review.save
      redirect_to products_url, notice: 'Review created successfully'
    else
      render 'products/show'
    end
  end

  def update
    if @review.update_attributes(review_params)
      flash[:notice] = "Review has been updated successfully!"
      redirect_to products_path(params[:product_id])
    else
      flash[:alert] = "Review failed to update!"
      render :edit
    end
  end

  def edit
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end
