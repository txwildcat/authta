class SessionsController < ApplicationController
    def new

    end

    def create
        # find the user trying to login
        @user = User.where({email: params["email"]})[0]
        if @user
            if BCrypt::Password.new(@user.password) #this checks for password accuracy and matches users_controller.rb
                #cookies: {}
                #session: {}
                session["user_id"] = @user.id #this carries the user id to every page by way of storing the cookie
                flash[:notice] = "You logged in!" #this provides a message
                redirect_to "/companies"
            else
                flash[:notice] = "Nope."
                redirect_to "/sessions/new"
            end
        else
            flash[:notice] = "Nope."
            redirect_to "/sessions/new"
        end
    end

    def destroy
        session["user_id"] = nil
        flash[:notice] = "Goodbye."
        redirect_to "/sessions/new"
    end
end
