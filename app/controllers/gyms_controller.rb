class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    #get one /Show
   def index
        gym = Gym.all
        render json: gym
   end 

    def show
        gym = find_gym
        render json: gym
    end

    

    #delete gym
    def destroy
        gym = find_gym
        gym.destroy
        head :no_content
#deletes gym, and memberships associated w it (dependent: :destroy)
    end

    def update
        gym = find_gym
        gym.update(gym_params)
        render json: gym, status: :accepted
    end

    private 
    
    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end

    def render_not_found_response
        render json: {error: "Gym not found"}, status: :not_found
    end

    #BONUS index & update 
end
