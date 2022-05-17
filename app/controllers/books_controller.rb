class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:book_id])
    end

    def update
        book = Book.find(params[:book_id])
        book.update(book_params)
        redirect_to "/books/#{book.id}"
    end

    private

        def book_params
            params.permit(:title, :author, :copyright, :available)
        end
end