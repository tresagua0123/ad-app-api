class AccountsController < FirebaseController
    # POST /accounts
    def create
        super do |decoded_token|
            @user = User.create(
                email: decoded_token['decoded_token'],
                uid: decoded_token['uid']
            )
            render json: @user
        end
    end

    # DELETE /accounts
    def destroy
        current_user.destroy 
        super
    end
end
