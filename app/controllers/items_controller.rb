class ItemsController < ApplicationController
  before_action :set_item#, except: :new #only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index

  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    #@plan = Plan.find(params[:id])
    @item = @plan.items.new
  end

  # GET /items/1/edit
  def edit
    # unless my_plan == @plan.id
    #   render action: :show
    # end
  end

  # POST /items
  # POST /items.json
  def create
    @item = @plan.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to(plan_path(@plan), notice: 'Item was successfully created.') }
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
        puts plan_path(@plan)
        format.html { redirect_to(plan_path(@plan), notice: 'Item was successfully updated.') }
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
      format.html { redirect_to @plan, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @plan = Plan.find(params[:plan_id])      
      @item = @plan.items.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :watts, :hours, :priority_id, :active)
    end
end
