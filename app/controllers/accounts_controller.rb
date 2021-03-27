class AccountsController < FirebaseController
    # POST /accounts
    def create 
        super do |decoded_token|
            User.create(
                email: decoded_token['decoded_token']
                uid: decoded_token['uid']
            )
        end
    end

    # DELETE /accounts
    def destroy
        current_user.destroy 
        super
    end
end
