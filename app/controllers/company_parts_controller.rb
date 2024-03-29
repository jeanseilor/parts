class CompanyPartsController < BackofficeController
  before_action :set_company_part, only: [:show, :edit, :update, :destroy]

  # GET /company_parts
  # GET /company_parts.json
  def index
    @company_parts = CompanyPart.all
  end

  # GET /company_parts/1
  # GET /company_parts/1.json
  def show; end

  # GET /company_parts/new
  def new
    @company_part = CompanyPart.new
   # @company_part.build_part_detail
  end
 
  #Busca  parts a parti da categoria passada por parametor.
	#converte para json.
  def get_part_by_category
    @categorys = PartsController::PartService.get_part_by_category(params[:param]);
    respond_to do |format|
      format.json { render json: @categorys }
    end  
  end

#Busca  parts a parti do carro passada por parametor.
#converte para json.
  def get_part_by_car
    @cars = PartsController::PartService.get_part_by_car(params[:param]);
    respond_to do |format|
      format.json { render json: @cars }
    end  
  end

#Busca  parts a parti do carro  e da category passada por parametor.
#converte para json.
  def get_part_by_car_category
    @cars = PartsController::PartService.get_part_by_car_category(params[:paran_car], params[:paran_category]);
    respond_to do |format|
      format.json { render json: @cars }
    end  
  end

  # GET /company_parts/1/edit
  def edit; end

  # POST /company_parts
  # POST /company_parts.json
  def create
    @company_part = CompanyPart.new(company_part_params)

    respond_to do |format|
      if @company_part.save
        format.html { redirect_to company_parts_path, notice: 'Company part was successfully created.' }
        format.json { render :show, status: :created, location: @company_part }
      else
        format.html { render :new }
        format.json { render json: @company_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_parts/1
  # PATCH/PUT /company_parts/1.json
  def update
    respond_to do |format|
      if @company_part.update(company_part_params)
        format.html { redirect_to company_parts_path, notice: 'Company part was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_part }
      else
        format.html { render :edit }
        format.json { render json: @company_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_parts/1
  # DELETE /company_parts/1.json
  def destroy
    @company_part.destroy
    respond_to do |format|
      format.html { redirect_to company_parts_url, notice: 'Company part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company_part
    @company_part = CompanyPart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_part_params
    params.require(:company_part).permit(:company_id, :part_id)
  end
end
