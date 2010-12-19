class UsersController < ApplicationController
  def index
    @users = User.all
    page = params[:page] || 1
    @users = @users.paginate(:page => page, :per_page => 10)    

  end
  
  def class_form
    @user = User.new
  end

  def class_information
    user_id = params[:user_id]
    @user = User.find(user_id)
    @class_information = ClassInformation.find(:all, :conditions => "user_id = #{user_id}")
  end
  
  def create
    @user = User.new(params[:user])    
    (1..7).each do |i|
     class_info = params[:"class_information#{i}"]
     @class_information = ClassInformation.new(class_info) unless class_info.values.all?{|i| i.empty?}
     @user.class_information << @class_information unless @class_information.nil?
    end
    respond_to do |format|
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
