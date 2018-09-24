class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]
  before_action :set_college, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  # GET /branches
  # GET /branches.json
  def index
    @branches = @college.branches.paginate(page: params[:page],per_page:4)
  end
  # GET /branches/1
  # GET /branches/1.json
  def show
  end

  # GET /branches/new
  def new
    @branch = Branch.new
    respond_to do |format|
      format.js { }
    end
  end

  # GET /branches/1/edit
  def edit
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = @college.branches.new(branch_params)
    @branch.save
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    @branch.update(branch_params)      
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to college_branches_path(@college), notice: 'Branch was successfully destroyed.' }
      format.js { }
    end
  end

	def list_branches
    if params[:branch].blank?
    	@branches = Branch.all.paginate(page: params[:page],per_page:5)
		else
			@branches = Branch.where("branch_name LIKE :prefix ", prefix:"#{params[:branch]}%").paginate(page: params[:page],per_page:5)
    end	
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end
	  def set_college
		  @college=College.find(params[:college_id])
	  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:college_id, :branch_name)
    end
end
