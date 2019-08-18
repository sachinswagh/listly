class TrashedListsController < ApplicationController
  before_action :set_list, only: [:show, :restore]
  PER_PAGE = Rails.env.development? ? 3 : 10

  # GET /trashed_lists
  # GET /trashed_lists.json
  def index
    @lists = List.inactive.paginate(page: params[:page], per_page: PER_PAGE)

    respond_to do |format|
      format.html
      format.json { render json: { status: 200, items: @lists } }
    end
  end

  # GET /trashed_lists/1
  # GET /trashed_lists/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: { status: 200, item: @list } }
    end
  end

  # UPDATE /lists/1/restore
  # UPDATE /lists/1/restore.json
  def restore
    @list.activate(with: :list_items)

    respond_to do |format|
      format.html { redirect_to trashed_lists_url, notice: "List #{@list.name} was successfully restored." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end
end
