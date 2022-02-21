class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    #get one client / show
    def index
        render json: Client.all
    end

    def show
        client = find_client
        render json: client
    end

    def update
        client = find_client
        render json: client.update(client_params), status: :accepted

    end

    private

    def find_client
        Client.find(params[:id])
    end

    def client_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: {error: "Client not found"}, status: :not_found
    end


    #BONUS index & update 
end
