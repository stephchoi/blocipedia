class ChargesController < ApplicationController
    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }", 
            description: "BigMoney Membership - #{current_user.email}", 
            amount: default_amount
        }
    end
    
    def create
    # Creates a Stripe Customer object, for associating with the charge
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )
 
        charge = Stripe::Charge.create(
            customer: customer.id, # NOT the user_id
            amount: default_amount,
            description: "BigMoney Membership - #{current_user.email}",
            currency: 'usd'
        )
 
        flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
        current_user.premium!
        redirect_to welcome_index_path
 
    # Stripe will send back CardErrors, with friendly messages when something goes wrong.
        rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path
    end
    
    def downgrade
        current_user.member!
        flash[:notice] = "You have downgraded back to a standard account."
        redirect_to new_charge_path
    end
    
    private
    def default_amount
       15_00 
    end
end
