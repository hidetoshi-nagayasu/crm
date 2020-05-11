class CustomerController < ApplicationController

  protect_from_forgery

  before_action :sign_in_required

  # GET /customer
  def index
    @customers = Customer.all.order('updated_at desc').page(params[:page]).per(10).where(is_deleted: 0)
  end

  # GET /customer/:id
  def show
    @customer = Customer.find(params[:id])
  end

  # GET /customer/new
  def new
    @customer = Customer.new
  end

  # POST /customer
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: '登録が完了しました。' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /customer/:id/edit
  def edit
    @customer = Customer.find(params[:id])
  end
  
  # PATCH /customer/:id
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Friend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer/:id
  def destroy
    @customer = Customer.find(params[:id])
    
    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Friend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def customer_params
    params.permit(
      :last_name,
      :first_name,
      :gender,
      :zip_code,
      :prefecture_code,
      :city,
      :street,
      :building,
      :phone_number,
      :mobile_number,
      :email,
      :created_by
    )
  end
end
