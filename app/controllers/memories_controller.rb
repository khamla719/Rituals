class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]

  # GET /memories
  # GET /memories.json
  def index
    # binding.pry
    @user = User.find_by(id: session[:id])
    @memories = @user.memories
  end

  # GET /memories/1
  # GET /memories/1.json
  def show
    @user = User.find_by(id: params[:user_id])
    @memory = Memory.find_by(id: params[:id])
  end

  # GET /memories/new
  def new
    # binding.pry
    @user = User.find_by(id: session[:id])
    @memory = @user.memories.new
  end

  # GET /memories/1/edit
  def edit
    # binding.pry
    @user = User.find_by(id: params[:user_id])
    @memory = Memory.find_by(id: params[:id])
    # @memory.update(memory_params)
    # redirect_to user_memories
  end

  # POST /memories
  # POST /memories.json
  def create
    # binding.pry
    @user = User.find_by(id: params[:user_id])
    @memory = Memory.new(memory_params)
    @memory.user_id = @user.id
    respond_to do |format|
      if @memory.save
        format.html { redirect_to user_path(@user), notice: 'memory was successfully created.' }
        format.json { render :show, status: :created, location: @memory }
      else
        format.html { render :new }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memories/1
  # PATCH/PUT /memories/1.json
  def update
    @memory = Memory.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to  user_path(@user), notice: 'memory was successfully updated.' }
        format.json { render :show, status: :ok, location: @memory }
      else
        format.html { render :edit }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memories/1
  # DELETE /memories/1.json
  def destroy
    # binding.pry
    @user = User.find_by(id: params[:user_id])
    @memory = Memory.find_by(id: params[:id])
    @memory.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user), notice: 'memory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memory
      if @memory
      @memory = Memory.find(params[:id])
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memory_params
      # binding.pry
      params.require(:memory).permit(:title, :url, :description, :story, :private)
    end
end
