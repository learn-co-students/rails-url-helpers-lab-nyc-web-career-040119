class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  
  end

  def show
    @student = Student.find(params[:id])
  end

  def update 

  end

  def activate 
    @student = Student.find(params[:id])
    if @student.active == false 
      @student.update(active: true )
    else @student.active == true 
      @student.update(active: false)
    end

    redirect_to student_path(params[:id])
    
  
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end