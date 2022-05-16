class LibraryBooksController < ApplicationController
    def index
        @library = Library.find(params[:library_id])
        @books = @library.books
    end

    def new
        @library = Library.find(params[:library_id])
    end

    def create
        library = Library.find(params[:library_id])
        book = library.books.create!(book_params)
        redirect_to "/libraries/#{library.id}/books"
    end

    private

        def book_params
            params.permit(:title, :author, :copyright, :available)
        end
end