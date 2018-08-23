class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
	before_action :set_branch, only: [:index, :new, :show, :edit, :update, :destroy, :create]
  before_action :set_college, only: [:index, :new, :show, :edit, :update, :destroy, :create]

  # GET /students
  # GET /students.json
  def index
    @students = @branch.students.paginate(page: params[:page],per_page:2)
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = @branch.students.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = @branch.students.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to college_branch_students_path(@college,@branch), notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to college_branch_students_path(@college,@branch), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to college_branch_students_url(@college,@branch), notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	def list_students
   @students = Student.paginate(page: params[:page],per_page:5)
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
		def set_branch
  				@branch=Branch.find(params[:branch_id])
 		end
		def set_college
			@college=College.find(params[:college_id])
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:branch_id, :student_name, :student_address, :student_sem)
    end
 
end
