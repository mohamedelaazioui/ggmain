class HomeController < ApplicationController
  def index
    @contact = Home.new(params[:home])
  end

  def create
    @contact = Home.new(params[:home])
    @contact.request = request
    respond_to do |format|

      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Home.new
        format.html {
          flash.now[:success] = "Thank you for sending us this message we will get back asap"
          render :index
        }
      else
        format.html {
          flash.now[:error] = "Oops something wrong happens, please try again or contact us by phone"
          render :index
        }
      end
    end
  end

end
