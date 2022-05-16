class LibraryBooksController < ApplicationController
    def index
        @library = Library.find(params[:library_id])
        @books = @library.books
    end

    def new
    end
end