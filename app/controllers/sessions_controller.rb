class SessionsController < FirebaseController

    include ActionController::HttpAuthentication::Token::ControllerMethods
    # POST /login
    def create 
        super do |decoded_token|
            User.find_by(uid: decoded_token['uid'])
        end
    end

    # DELETE /logout
    def destroy
        super
    end
end
