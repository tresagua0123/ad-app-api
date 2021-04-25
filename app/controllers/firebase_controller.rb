class FirebaseController < ApplicationController
    before_action :logged_in_user, only: [:destroy]

    # GET _login 
    def new 
        redirect_to user_path if logged_in?
    end

    def create 
        if decoded_token = authenticate_firebase_id_token 
            user = yield(decoded_token)
            render json: user
            log_in(user)
        else  
            redirect_to login_url
        end
    end

    def destroy
        log_out if logged_in?
        redirect_to login_url
    end
end
