class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def class_form
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
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
