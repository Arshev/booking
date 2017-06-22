class CarsController < ApplicationController

  before_action :load_booking, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js, :json

  def index
    respond_with (@bookings = Car.all)
  end

  def show
    respond_with @car
  end

  def new
    respond_with (@car = current_user.cars.new)
  end

  def edit
  end

  def create
    # @car = current_user.cars.create(params[:car_params])
    # @saved = @car.save
    # respond_with @car, :location => @car if @saved
    @car = current_user.cars.create(car_params)
    if @car.save
      redirect_to @car, notice: 'Add car success'
    else
      render :new
    end
  end

  def update
    @car.update(car_params) if current_user.check_author(@car)
    respond_with @car
  end

  def destroy
    @car.destroy if current_user.check_author(@car)
    respond_with @car
  end

  private

  def load_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:id, :name, :body, :color, :fuel, :volume)
  end
end
