class BooksController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :destroy]
    def index
        if params[:category].blank?
        @books = Book.all.order("created_at DESC")
        else
            @category_id= Category.find_by(name: params[:category]).id
            @books = Book.where(:category_id => @category_id).order("created_at DESC")
        end
    end
    def show
        if @book.reviews.blank?
            @average_review = 0
        else
            @average_review = @book.reviews.average(:rating).round(2)
        end
    end
    def edit
        @categories = Category.all.map{ |c| [c.name, c.id]}
    end
    def update
        @book.category_id = params[:category_id]
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
            render 'edit'
        end

    end
    def destroy
        @book.destroy
        redirect_to root_path
    end
    def new 
        @book =  Current.user.books.build
        @categories = Category.all.map{ |c| [c.name, c.id]}
    end
    def create
        @book = Current.user.books.build(book_params)
        @book.category_id = params[:category_id]
        
        if @book.save
            redirect_to root_path
        else
            redirect_to 'new'
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :description, :author, :category_id, :book_img, :price)
    end
    def find_book
        @book = Book.find(params[:id])
    end
end

