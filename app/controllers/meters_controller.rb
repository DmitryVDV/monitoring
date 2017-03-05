class MetersController < ApplicationController
    skip_before_filter :verify_authenticity_token
    def index
        @meters = Meter.all
        #render json: posts #{status: 'SUCCESS', message: 'Loaded all posts', data: posts}, status: :ok
    end 
  #def show; end

  def meter_data
    @meters = Meter.all
    
    
    puts render json: @meters
    

    end

  

    def create
      @post = Meter.new(meter_params)

      puts 'Test'

      if @post.save
       respond_to do |format|
          format.json{render json: @post, status: :created }
        end
      end
     # if post.save
     #   render json: post, status: :created
     # else
     #   render_error(post, :unprocessable_entity)
     # end
    end
  private
    def meter_params
      params.require(:meter).permit(:meter_value, :meter_date)
    end
end
