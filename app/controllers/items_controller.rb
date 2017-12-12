class ItemsController < ApplicationController
  before_action :set_event
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = @event.items.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = @event.items.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = @event.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to event_items_path(@event), notice: I18n.t('item.created.successfully')  }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to event_items_path(@event), notice: I18n.t('item.updated.successfully') }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to event_items_path(@event), notice: I18n.t('item.destroyed.successfully') }
      format.json { head :no_content }
    end
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = @event.items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:event_id, :category_id, :memo, :registered_at, :tmp_amount,
        tmp_payment_attributes:  [:id, :item_id, :member_id],
        act_payments_attributes: [:id, :item_id, :member_id, :_destroy],
        )
    end
end
