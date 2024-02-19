class AuthorsController < ApplicationController
    before_action :set_author, only: [:show, :update, :destroy, :books_index]
    # The set_author method can be used for custom foutes as well.
# before_action :set_author, except [:index, :create]
    # This will set it for all routes EXCEPT the ones listed. This is an alternative to only  


    def index
        authors = Author.all
        render json: authors, status: 200
    end
    
    def show
        render json: @author, status: 200
    end

    def update
        if @author.update(author_params)
          render json: @author
        else
          render json: { error: "Unable to update author." }
        end
    end

    # def create
    #     author = Author.new(author_params)
    #     if author.save
    #         render json: author
    #     else
    #         render json: { error: "Unable to create author." }
    #     end
    # end

    def create
        author = Author.new(author_params)
        if author.save
            render json: author, status: :created
        else
            render json: author.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @author.destroy
          render json: { message: "Author deleted successfully." }
        else
          render json:  { error: "Unable to delete author." }
        end
    end

    def books_index
        author_books = @author.books
        render json: author_books, status: :ok
    end
    

    private


    def set_author
        @author = Author.find(params[:id])
    end

    def author_params
        params.permit( :first_name, :last_name )
    end

    # def author_params
    #     params.require(:author).permit( :first_name, :last_name )
    # end
end
