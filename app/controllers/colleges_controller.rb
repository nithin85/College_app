class CollegesController < ApplicationController
  before_action :set_college, only: [:show, :edit, :update, :destroy]

  # GET /colleges
  # GET /colleges.json
  def index
    if params[:name].blank? &&  params[:add].blank?
			@colleges = College.active.all.paginate(page: params[:page],per_page:4)
    elsif !params[:name].blank? &&  !params[:add].blank?
      @colleges = College.where("name LIKE :prefix and address LIKE :add", prefix:"#{params[:name]}%",add:"#{params[:add]}%").paginate(page: params[:page],per_page:4)
		elsif !params[:name].blank?
      @colleges = College.where("name LIKE :prefix ", prefix:"#{params[:name]}%").paginate(page: params[:page],per_page:4)
    elsif !params[:add].blank?
		  @colleges = College.where("address LIKE :add", add:"#{params[:add]}%").paginate(page: params[:page],per_page:4)
   #name: params[:name]).paginate(page: params[:page],per_page:4)
		end
  end

  # GET /colleges/1
  # GET /colleges/1.json
  def show
  end

  # GET /colleges/new
  def new
    @college = College.new
    respond_to do |format|
      format.js { }
    end
  end

  # GET /colleges/1/edit
  def edit
  end

   def addnewuser
   end

  # POST /colleges
  # POST /colleges.json
  def create
    @college = College.new(college_params)
    @college.save
  end

  # PATCH/PUT /colleges/1
  # PATCH/PUT /colleges/1.json
  def update
    @college.update(college_params)    
  end

  # DELETE /colleges/1
  # DELETE /colleges/1.json
  def destroy
    @college.active_record = false
    @college.save
    respond_to do |format|
      format.html { redirect_to colleges_url, notice: 'College was successfully destroyed.' }
      format.js{ }
    end
  end
	def students
    @college = College.find(params[:id])
		@students=Student.joins(:branch).where('branches.college_id=?',params[:id])
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.require(:college).permit(:name, :address, :contact)
    end
   
end
