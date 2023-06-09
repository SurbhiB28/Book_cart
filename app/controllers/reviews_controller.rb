class ReviewsController < ApplicationController
    before_action :find_book
    before_action :find_review, only: [:edit, :update, :destroy]
    def new
        @review = Review.new
    end

    def edit
    end

    def destroy
        @review.destroy
        redirect_to book_path(@book)
    end

    def update

        if @review.update(review_params)
            redirect_to book_path(@book)
        else
            render 'edit'
        end
    end

    def create
        @review = Review.new(review_params)
        @review.book_id = @book.id 
        @review.user_id = Current.user.id
        if @review.save
            redirect_to book_path(@book)
        else
            render 'new'
        end
    end

    private

    def review_params
        params.require(:review).permit(:rating, :comment)
    end

    def find_book
        @book = Book.find(params[:book_id])
    end

    def find_review
        @review = Review.find(params[:id])

    end
end
