class MembershipsController < ApplicationController
    #create new membership

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
        
    end

    # *validation client can only have one membership w gym

    private 

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

end
