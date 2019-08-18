class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :soft_delete, :destroy]
  PER_PAGE = Rails.env.development? ? 3 : 10

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.active.paginate(page: params[:page], per_page: PER_PAGE)

    respond_to do |format|
      format.html
      format.json { render json: { status: 200, items: @lists } }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: { status: 200, item: @list } }
    end
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: "List '#{@list.name}' was successfully created." }
        format.json { render json: { status: 200, message: 'success' } }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: "List '#{@list.name}'' was successfully updated." }
        format.json { render json: { status: 200, message: 'success' } }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # Clicking on 'Destroy' button triggers this action.
  # DELETE /lists/1/soft_delete
  # DELETE /lists/1/soft_delete.json
  def soft_delete
    @list.deactivate(with: :list_items)

    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List '#{@list.name}' was successfully moved to trash." }
      format.json { render json: { status: 200, message: 'success' } }
    end
  end

  # Clicking on 'Delete' button triggers this action.
  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List '#{@list.name}' was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :description, list_items_attributes: [:id, :name, :_destroy])
    end
end
