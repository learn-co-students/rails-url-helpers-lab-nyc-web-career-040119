class StudentsController < ApplicationController
  before_action :set_student, only: :show

  # INDEX
  def index
    @students = Student.all
  end

  # SHOW
  def show
    set_student
  end

  # EDIT
  def edit
    set_student
  end

  def update
    set_student.update(student_params)
    redirect_to student_path(set_student)
  end

  # NEW
  def new
  end

  def create
    @student = Student.create(student_params)
    redirect_to student_path(@student)
  end

  # OTHER METHODS
  def activate
    # Check to see if student is already active and set to the opposite of current status
    if !set_student.active == true
      set_student.update(active: true)
    else
      set_student.update(active: false)
    end

    set_student.save
    redirect_to student_path(set_student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit!
    end
end
