class DropsController < ApplicationController
  before_action :set_drop, only: [:show, :edit, :update, :destroy]

  # GET /drops
  # GET /drops.json
  def index
    @drops = Drop.all
  end

  # GET /drops/1
  # GET /drops/1.json
  def show
  end

  # GET /drops/new
  def new
    if current_user != nil
      @drop = current_user.drops.build
    else
      @drop = User.all[1].drops.build
    end
  end

  # GET /drops/1/edit
  def edit
  end

  # POST /drops
  # POST /drops.json
  def create
    if current_user != nil
      @drop = current_user.drops.new(drop_params)
    else
      @drop = User.all[1].drops.new(drop_params)
    end
      respond_to do |format|
      if @drop.save
        format.html { redirect_to @drop, notice: 'Drop was successfully created.' }
        format.json { render :show, status: :created, location: @drop }
      else
        format.html { render :new }
        format.json { render json: @drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drops/1
  # PATCH/PUT /drops/1.json
  def update
    respond_to do |format|
      if @drop.update(drop_params)
        format.html { redirect_to @drop, notice: 'Drop was successfully updated.' }
        format.json { render :show, status: :ok, location: @drop }
      else
        format.html { render :edit }
        format.json { render json: @drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drops/1
  # DELETE /drops/1.json
  def destroy
    if @drop.file.attached?
      @drop.file.purge
    end
    @drop.destroy
    respond_to do |format|
      format.html { redirect_to drops_url, notice: 'Drop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drop
      @drop = Drop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drop_params
      params.require(:drop).permit(:title, :description, :file)
    end
end
