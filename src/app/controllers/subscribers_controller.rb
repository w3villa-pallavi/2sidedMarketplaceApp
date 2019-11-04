require "stripe"

class SubscribersController < ApplicationController
    def new


Stripe.api_key = ''

@session = Stripe::Checkout::Session.create(
  payment_method_types: ['card'],
  line_items: [{
    name: 'Runnerfy Subscription',
    description: 'Lifetime subscription to Runnerfy',
    amount: 1000,
    currency: 'aud',
    quantity: 1,
  }],
  success_url: 'https://localhost3000/subscribers/complete',
  cancel_url: 'https://localhost3000/subscribers/cancel',
)
    end

    def complete
        render html: "Complete".html_safe
    end
    def cancel
        render html: "Complete".html_safe
    end
  
end
