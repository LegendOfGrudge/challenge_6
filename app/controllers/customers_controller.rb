class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def alphabetized
    @customers = Customer.all.order("full_name ASC")
  end

  def missing_email
    @customers = Customer.all.where(email_address: "")
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def customer_params
      params.require(:customer).permit(:full_name, :phone_number, :email_address, :notes, :avatar)
    end
end
