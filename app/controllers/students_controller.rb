require 'fastercsv'
class StudentsController < ApplicationController

  def index
    @students = Student.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
  end

  def new
    @student = Student.new
    1.times{ @student.class_infos.build }

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @student }
    end
  end

  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to :action => 'new' }
        flash[:notice] = 'Student Class Information was successfully saved.'
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def class_information
    student_id = params[:student_id]
    @student = Student.find(student_id)
    @class_informations = ClassInfo.find(:all, :conditions => "student_id = #{student_id}")
  end 

  def csv
    response.headers['Content-Type'] = 'text/csv'
    response.headers['Content-Disposition'] = "attachment; filename=Students_list.csv"

    render :status => 200, :text => Proc.new { |response, output|
      title = ["LAST NAME", "FIRST NAME", "STONY BROOK ID", "HOST INSTITUTION"]
      output.write FasterCSV.generate_line(title)
      @students = Student.find(:all, :conditions => ['last_name !=? and first_name !=?', '', '' ])
      @students.each do |user|
        lname = user.last_name
        fname = user.first_name
        stony_id = user.stony_brook_id
        host_inst = user.host_institution
        output.write FasterCSV.generate_line([lname, fname, stony_id, host_inst])
        output.write FasterCSV.generate_line(["", "", "", "", "CLASS INFORMATIONS OF #{user.first_name}"])
        output.write FasterCSV.generate_line(["", "", "", "", "TITLE", "CLASS NUMBER", "SECTION NUMBER", "DAY", "CREDITS", "START_TIME", "STOP_TIME"])
        user.class_infos.each do |info|
          title = info.title
          class_no = info.class_number
          section_no = info.section_number
          day = info.day
          credits = info.credits
          start_time = info.start_time.strftime("%I:%M %p") unless info.start_time.nil?
          stop_time = info.stop_time.strftime("%I:%M %p") unless info.stop_time.nil?
          output.write FasterCSV.generate_line(["", "", "", "", title, class_no, section_no, day, credits, start_time, stop_time])
        end
      end
    }
  end
end