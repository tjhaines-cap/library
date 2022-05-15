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
        library = Library.create!(
            name: params[:name], 
            branch_num: params[:branch_num],
            city: params[:city],
            open: params[:open])
        redirect_to "/libraries/#{library.id}"
    end
end