class AccountsController < FirebaseController
    # POST /accounts
    def create
        super do |decoded_token|
            puts decoded_token
            User.create(
                email: decoded_token['decoded_token'][:payload]['email'],
                photo_url: decoded_token['decoded_token'][:payload]['picture'],
                uid: decoded_token['uid'],
            )
        end
    end

    # DELETE /accounts
    def destroy
        current_user.destroy 
        super
    end
end
