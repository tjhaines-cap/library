class LibrariesController < ApplicationController
    def index
        @libraries = Library.sort_by_created_at
    end

    def show
        @library = Library.find(params[:id])
    end
end