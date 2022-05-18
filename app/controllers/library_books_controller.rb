class LibraryBooksController < ApplicationController
    def index
        # binding.pry
        @library = Library.find(params[:library_id])
        if params[:sort_param]
            @books = @library.books.order_by_title
        elsif params[:threshold]
            @books = @library.books.records_over_threshold(params[:threshold])
        else
            @books = @library.books
        end
    end

    def new
        @library = Library.find(params[:library_id])
    end

    def create
        library = Library.find(params[:library_id])
        book = library.books.create!(book_params)
        redirect_to "/libraries/#{library.id}/books"
    end

    def sort
        @books = Book.order_by_title
        redirect_to action: "index", sort_param: true
    end

    def threshold
        library = Library.find(params[:library_id])
        Book.records_over_threshold(:copyright_year)
        redirect_to action: "index", threshold: params[:copyright_year] 
    end

    private

        def book_params
            params.permit(:title, :author, :copyright, :available)
        end
end