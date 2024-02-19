class PublishersController < ApplicationController
    before_action :set_publisher, except: [:index, :create]

    def index
        publishers = Publisher.all
        render json: publishers, status: 200
    end
    
    def update
        if @publisher.update(publisher_params)
          render json: @publisher
        else
          render json: { error: "Unable to update publisher." }
        end
    end

    def create
        publisher = Publisher.new(publisher_params)
        if publisher.save
            render json: publisher, status: :created
        else
            render json: publisher.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @publisher.destroy
          render json: { message: "Publisher deleted successfully." }
        else
          render json:  { error: "Unable to delete publisher." }
        end
    end

   
    private


    def set_publisher
        @publisher = Publisher.find(params[:id])
    end

    def publisher_params
        params.permit( :name )
    end

end
