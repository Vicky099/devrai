class MembersController < ApplicationController
  layout 'application'

  def index
    @members = Member.order('id desc')
    @news = News.order('id desc')
  end

  def new
    @member = Member.new
  end

  def create
    member = Member.new(member_params)
    member.build_picture(photo: params[:member][:photo])
    if member.save
      flash[:success] = "Registered successfully."
      redirect_to members_path
    else
      flash[:danger] = "Something goes wrong. please fill the information and submit it again. Thanks."
      render :new
    end
  end

  def show
    @member = Member.find_by_id(params[:id])
  end

  def edit
    @member = Member.find_by_id(params[:id])
  end

  def update
    member = Member.find_by_id(params[:id])
    member.build_picture(photo: params[:member][:photo])
    if member.update_attributes(member_params)
      flash[:success] = "Your Profile updated successfully."
      redirect_to member_path(member.id)
    else
      flash[:danger] = "Something went wrong. please fill the information and submit it again. Thanks.
        "
      render :edit
    end
  end

  def destroy
    member = Member.find_by_id(params[:id])
    if member.destroy
      flash[:success] = "Profile deleted successfully."
      redirect_to members_path
    else
      flash[:danger] = "Something went wrong. please fill the information and submit it again. Thanks.
        "
      render :index
    end
  end

  private
  def member_params
    params.require(:member).permit(:firstname, :lastname, :gender, :mobile_number, :email_id, :village, :taluka, :district, :state, :membership, :about_me, :about_devrai, :tree_planted_count)
  end
end
