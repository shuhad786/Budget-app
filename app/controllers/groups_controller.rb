class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  # def show
  #   @group = Group.find(params[:id])
  #   @entities = Entity.where(group_id: params[:id])
  # end

  def show
    @group = Group.find(params[:id])
    @entities = @group.entities.all
    @entity = Entity.new
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  def create
    @group = Group.new(group_params)
    @group.users_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Category successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |_format|
      if @group.update(group_params)
        redirect_to authenticated_root_path, notice: 'Group was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Category successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :users_id)
  end
end
