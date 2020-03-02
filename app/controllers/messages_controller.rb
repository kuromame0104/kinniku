class MessagesController < ApplicationController
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?, except: [:toppage]

  def toppage
  end

  def index
    @messages = Message.all
    @messages = @messages.includes(:user).order("created_at DESC")
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    redirect_to root_path
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to root_path
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    message.update(message_params)
    redirect_to root_path
  end

  def show
    @message = Message.find(params[:id])
    @comment = Comment.new
    @comments = @message.comments.includes(:user)
  end

  private

  def message_params
    params.require(:message).permit(:category_id, :image, :text).merge(user_id: current_user.id)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end
end
