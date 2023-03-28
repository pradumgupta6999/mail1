class OrdersController < ApplicationController
    def index
        @order = Order.all
    end

    def new
        @order = Order.new(params[:id])
    end

    def create
        @order = Order.new(params_data)
        if @order.save
            OrderMailer.with(order: @order).new_order_email.deliver_now

            flash[:success] = "Thank you for your order! We'll get contact you soon!"
            redirect_to orders_path

        else
            flash.now[:error] = "Your order form had some errors. Please check the form and resubmit."
            render :new
          end
    end

    private
    def params_data
        params.require(:order).permit(:name,:email)
    end
end
