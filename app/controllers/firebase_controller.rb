class FirebaseController < ApplicationController
    def create 
        if decoded_token = authenticate_firebase_id_token 
            user = yield(decoded_token)
            log_in(user)
            redirect_back_or(user_path)
        else  
            redirect_to login_url
        end
    end
end
