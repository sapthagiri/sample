#require 'fastercsv'
class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def class_form
    @user = User.new
  end

  def class_information
    user_id = params[:user_id]
    @user = User.find(user_id)
    @class_information = ClassInformation.find(:all, :conditions => "user_id = #{user_id}")
  end

  def csv
    response.headers['Content-Type'] = 'text/csv'
    response.headers['Content-Disposition'] = "attachment; filename=Students_list.csv"

    render :status => 200, :text => Proc.new { |response, output|
      title = ["LAST NAME", "FIRST NAME", "STONY BROOK ID", "HOST INSTITUTION"]
      output.write FasterCSV.generate_line(title)
      @users = User.all
      @users.each do |user|
        lname = user.last_name
        fname = user.first_name
        stony_id = user.stony_brook_id
        host_inst = user.host_institution
        output.write FasterCSV.generate_line([lname, fname, stony_id, host_inst])
        output.write FasterCSV.generate_line(["", "", "", "", "CLASS INFORMATIONS OF #{user.first_name}"])
        output.write FasterCSV.generate_line(["", "", "", "", "TITLE", "CLASS NUMBER", "SECTION NUMBER", "DAY", "CREDITS", "START_TIME", "STOP_TIME"])
        user.class_information.each do |info|
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
  
  def create
    @user = User.new(params[:user])
    @credits = 0
    @time_range = []
    
    (1..7).each do |i|
      class_info = params[:"class_information#{i}"]
      unless class_info.values.all?{|i| i.empty?}      
        @class_information = ClassInformation.new(class_info) 
        @user.class_information << @class_information 
      end
      class_info.clear
    end
    
    @user.class_information.each do |class_info|
      temp_range = []      
      credit = class_info.credits
      day = class_info.day
      start_time = class_info.start_time
      stop_time = class_info.stop_time
      temp_range = [day, start_time, stop_time]
      
      @credits = @credits + credit.to_i 
      @time_range << temp_range unless temp_range.empty?    
    end
    count = @time_range.size
    
    (1..count).each do |i|
      first_day = @time_range.first
      @time_range.delete_at(0)
      @time_range.each do |time|
        if time.first.include?(first_day.first) || first_day.first.include?(time.first) 
          first_start_time = first_day[1]
          first_stop_time = first_day[2]
          second_start_time = time[1]
          second_stop_time = time[2]
          if (second_start_time.between?(first_start_time, first_stop_time) || second_stop_time.between?(first_start_time, first_stop_time) || first_start_time == second_start_time)
            @time_conflict = true unless (first_stop_time == second_start_time if first_start_time != second_start_time)
          end
        end
      end
    end
    max_credit = true if @credits > 17    
    
    respond_to do |format|
      if max_credit
        format.html { render :action => 'class_form' }
        flash[:error] = "CANT REGISTER FOR MORE THAN 17 CREDITS FOR EACH SEMESTER."
      elsif @time_conflict
        format.html { render :action => 'class_form' }
        flash[:error] = "TIME CONFLICT"
      elsif @user.class_information.empty?
        format.html { render :action => 'class_form' }
        flash[:error] = "PLEASE ENTER ATLEAST ONE CLASS INFORMATION"        
      else
        if @user.save
          format.html { redirect_to(:action => 'index') }
          flash[:notice] = 'Class form was successfully created.'
        else
          format.html { render :action => 'class_form' }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }    
        end
      end
    end
  end
end

