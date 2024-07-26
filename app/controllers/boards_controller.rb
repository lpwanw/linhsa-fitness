# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i[show edit update destroy]

  # GET /boards or /boards.json
  def index
    @boards = current_user.boards.all
  end

  # GET /boards/1 or /boards/1.json
  def show; end

  # GET /boards/new
  def new
    @board = current_user.boards.new
  end

  # GET /boards/1/edit
  def edit; end

  # POST /boards or /boards.json
  def create # rubocop:disable Metrics/AbcSize
    @board = current_user.boards.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to board_url(@board), notice: I18n.t("boards.create.success") }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1 or /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to board_url(@board), notice: I18n.t("boards.update.success") }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1 or /boards/1.json
  def destroy
    @board.destroy!

    respond_to do |format|
      format.html { redirect_to boards_url, notice: I18n.t("boards.destroy.success") }
      format.json { head :no_content }
    end
  end

  private

  def set_board
    @board = current_user.boards.find_by(id: params[:id])

    return if @board

    respond_to do |format|
      format.html do
        flash[:error] = I18n.t("boards.not_found")
        redirect_to boards_url
      end
      format.json { head :not_found }
    end
  end

  def board_params
    params.require(:board).permit(:title)
  end
end
