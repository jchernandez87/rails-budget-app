class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.where(author_id: current_user.id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.author_id = current_user.id
    if @group.save
      flash[:notice] = 'Category added successfully'
      redirect_to groups_path
    else
      flash[:error] = 'Failed'
      redirect_to new_group_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
