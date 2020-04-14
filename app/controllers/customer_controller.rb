class CustomerController < ApplicationController

  # GET /customer
  def index
    @customers = Customer.order('updated_at').limit(20)
  end

  # GET /customer/:id
  def show
  end

  # GET /customer/new
  def new
  end

  # POST /customer
  def create
  end

  # GET /customer/:id/edit
  def edit
  end
  
  # PATCH /customer/:id
  def update
  end
end
