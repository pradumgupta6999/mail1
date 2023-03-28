class OrderMailer < ApplicationMailer
    def new_order_email
        @order = params[:order]
        mail(to: "pradum.gupta@preciousinfosystem.com", subject: "You got a new order!")
        # attachments['nature.jpeg'] = File.read('/home/developer/image.jpeg')

    end
end
