class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show destroy]
     # GET /hotels
     def index
       @hotels = Hotel.all
       render json: HotelsRepresenter.new(@hotels).as_json
     end
     # POST /hotel
     def create
       @hotel = Hotel.create(hotel_params)
       if @hotel.save
         render json: HotelRepresenter.new(@hotel).as_json, status: :created
       else
         render json: @hotel.errors, status: :unprocessable_entity
       end
     end
     # GET /hotels/:id
    def show
      render json: HotelRepresenter.new(@hotel).as_json
    end
     # DELETE /hotels/:id
     def destroy
       @hotel.destroy
       head :no_content
     end
     private
     def hotel_params
       params.permit(:name, :user_id)
     end
     def set_hotel
       @hotel = Hotel.find(params[:id])
     end
end
