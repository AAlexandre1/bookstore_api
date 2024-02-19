class BooksController < ApplicationController
    before_action :set_book, only: [:update, :destroy]
       
        def update
            if @book.update(book_params)
              render json: @book, status: :ok
            else
              render json: { error: "Unable to update book." }
            end
        end
    
        # def create
        #     book = Book.new(book_params)
        #     if book.save
        #         render json: book
        #     else
        #         render json: { error: "Unable to create book." }
        #     end
        # end
    
        def create
          book = Book.new(book_params)
            if book.save
                render json: book, status: :created
            else
                render json: book.errors, status: :unprocessable_entity
            end
        end
    
        def destroy
            if @book.destroy
              render json: { message: "Book deleted successfully." }
            else
              render json:  { error: "Unable to delete book." }
            end
        end
    
    
        private
    
    
        def set_book
            @book = Book.find(params[:id])
        end
    
        def book_params
            params.require(:book).permit( :title, :isbn, :author_id, genre_ids: [1], :publisher_id =>() )
        end
    
        # def book_params
        #     params.require(:book).permit( :title, :publisher, :isbn )
        # end
end
