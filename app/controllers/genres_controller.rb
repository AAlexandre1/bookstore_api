class GenresController < ApplicationController
    before_action :set_genre, only: [:update, :destroy]


    def index
        genres = Genre.all
        render json: genres, status: 200
    end
    
    def update
        if @genre.update(genre_params)
          render json: @genre
        else
          render json: { error: "Unable to update genre." }
        end
    end

    def create
        genre = Genre.new(genre_params)
        if genre.save
            render json: genre, status: :created
        else
            render json: genre.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @genre.destroy
          render json: { message: "Genre deleted successfully." }
        else
          render json:  { error: "Unable to delete genre." }
        end
    end
    

    private


    def set_genre
        @genre = Genre.find(params[:id])
    end

    def genre_params
        params.permit( :name )
    end

end
