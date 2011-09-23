class ImagesController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :edit, :update]
  
  @@BUCKET = "suitriot"
  
  def index
    @images = Image.order(:created_at).limit(12)
  end
  
  def show
    @image = Image.find(params[:id])
    @user = current_user
    @image.votes.where(:user_id => @user).first.nil? ? @vote = Vote.new(:image => @image, :user => current_user)
                                                     : @vote = @image.votes.where(:user_id => @user).first
  end
  
  def new
    @user = @current_user
    @image = Image.new
  end
  
  def create
    fileUp = params[:upload]
    if fileUp['datafile'].size > 5.megabytes
      flash[:error] = "Maximum image size is 5 MB"
      redirect_to :action => :new
      return
    end
    orig_filename = fileUp['datafile'].original_filename
    filename = Digest::SHA1.hexdigest("#{Time.now.utc}--#{orig_filename}")
    filename = "#{filename}.png"
    AWS::S3::S3Object.store(filename, fileUp['datafile'].read, @@BUCKET, :access => :public_read)
    url = AWS::S3::S3Object.url_for(filename, @@BUCKET, :authenticated => false)
    @image = Image.new(params[:image])
    @image.user = current_user
    @image.filename = filename
    @image.url = url;
    if @image.save
      flash[:success] = "Image saved!"
      redirect_to :action => :show, :id => @image
    else
      flash[:error] = "ERROR: Unable to save the image that was provided."
      redirect_to :action => :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    AWS::S3::S3Object.find(@image.filename.to_s, @@BUCKET).delete
    @image.destroy
    redirect_to :account
  end
end