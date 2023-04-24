class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :set_render_cart
    before_action :initialize_cart

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
      end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil?
    end

    def set_render_cart
        @render_cart = true
    end

    def initialize_cart
        @cart ||= Cart.find_by(id: session[:cart_id])

        if @cart.nil?
            @cart = Cart.create
            session[:cart_id] = @cart.id
        end
    end
end
