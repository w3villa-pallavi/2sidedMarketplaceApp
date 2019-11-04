class SubscribersController < ApplicationController

    def new
        
    end

    def update
        token = params[:stripeToken]

        customer = Stripe::Customer.create(
            card: token,
            plan
        )


    end
end
