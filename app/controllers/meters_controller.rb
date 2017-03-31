class MetersController < ApplicationController
    skip_before_filter :verify_authenticity_token
    def index
        @meters = Meter.all
        #render json: posts #{status: 'SUCCESS', message: 'Loaded all posts', data: posts}, status: :ok
    end 
  #def show; end

  def meter_data
    @meters = Meter.all

   #puts render json: @meters
  end

  def create
    # Чтобы достучаться до массива в JSON, нужно делать так, потом доступ к параметрам puts @post_value[:meters_arr][0][:meter_value]
    


    request.headers.each do |single|
      puts "---------------"
      puts single
    end
    
    puts @http_params

    @post_value = params.permit(:id_device, {meters_arr: [:meter_value, :meter_date]})
    @post_value[:meters_arr].each do |row|
      
      #Если каждый раз не создавать класс в цикле, данные первый раз Insert в БД, второй раз Update
      @db_values = Meter.new
        
      @db_values.id_device = @post_value[:id_device]
      @db_values.meter_value = row[:meter_value]
      @db_values.meter_date = row[:meter_date]

      puts row[:meter_value]
      puts row[:meter_date]
        
      if @db_values.save
        
      end 
    end     
     
    respond_to do |format|
      format.json{render json: @post_value, status: :created }
    end

      #if @post.save
      # respond_to do |format|
      #    format.json{render json: @post, status: :created }
      #  end
      #end
     # if post.save
     #   render json: post, status: :created
     # else
     #   render_error(post, :unprocessable_entity)     # end
end

  private
    def meter_params
      #params.require(:meter).permit(:meter_value, :meter_date)
       #params.require(:meter).permit(:id_device)
      # params.require(:meter).permit(meters_arr: [:meter_value,:mater_date])
      params.permit(:id_device, {meters_arr: [:meter_value, :meter_date]})
    end
end
