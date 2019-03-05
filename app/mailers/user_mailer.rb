class UserMailer < ApplicationMailer
    
    def welcome_email(user)
        @user = user
        @url = 'https://pussysnapshot-prod.herokuapp.com/login'
        mail(to: @user.email, subject: 'Bienvenue')
    end

    def order_email(user)
        @user = user
        mail(to: @user.email, subject: 'Bravo pour ton achat (zoul)')
    end
end
