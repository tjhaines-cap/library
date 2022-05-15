class LibrariesController < ApplicationController
    def index
        @libraries = Library.sort_by_created_at
    end

    def show
        @library = Library.find(params[:id])
    end

    def new
    end

    def create
        library = Library.create!(library_params)
        redirect_to "/libraries"
    end

    def library_params
        params.permit(:name, :branch_num, :city, :open)
    end

    def edit
    end
end