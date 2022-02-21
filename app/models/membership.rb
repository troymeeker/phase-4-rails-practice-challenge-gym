class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validates :client, uniqueness: {scope: :gym}
    #client can only have one membership w/ this one gym
end
