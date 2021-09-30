class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :require_signin

  # GET /clients or /clients.json
  def index
    if params[:term]
      @clients = Client.where('first_name like ?', "%#{params[:term]}%")
                       .or(Client.where('last_name like ?', "%#{params[:term]}%"))
                       .or(Client.where('email like ?', "%#{params[:term]}%"))
                       .or(Client.where(dni: params[:term]))
                       .or(Client.where('first_name || " " || last_name like ?', "%#{params[:term]}%"))
      @term = params[:term]
      return
    end

    @clients = Client.all
  end

  # GET /clients/1 or /clients/1.json
  def show
    @subscription = Subscription.new
    @payment = Payment.new
    @activities = @client.activities
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        @client.generate_barcode
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :dni, :phone_number, :birthday, :email, :medic_file)
    end
end
