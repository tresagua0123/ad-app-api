class FirebaseController < ApplicationController
    before_action :logged_in_user, only: [:destroy]

    # GET _login 
    def new 
        redirect_to user_path if logged_in?
    end

    def create 
        puts "firebase_controller_create"
        if decoded_token = authenticate_firebase_id_token 
            user = yield(decoded_token)
            log_in(user)
            redirect_back_or(user_path)
        else  
            redirect_to login_url
        end
    end

    def destroy
        log_out if logged_in?
        redirect_to login_url
    end
end
