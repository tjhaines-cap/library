class LibrariesController < ApplicationController
    def index
        @libraries = Library.all
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

    
    def edit
        @library = Library.find(params[:library_id])
    end
    
    def update
        library = Library.find(params[:library_id])
        library.update(library_params)
        redirect_to "/libraries/#{library.id}"
    end

    private
    
    def library_params
        params.permit(:name, :branch_num, :city, :open)
    end
end