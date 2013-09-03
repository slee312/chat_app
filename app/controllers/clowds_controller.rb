class ClowdsController < ApplicationController
  # GET /clowds
  # GET /clowds.json
  def index
    @clowds = Clowd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clowds }
    end
  end

  # GET /clowds/1
  # GET /clowds/1.json
  def show
    @clowd = Clowd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clowd }
    end
  end

  # GET /clowds/new
  # GET /clowds/new.json
  def new
    @clowd = Clowd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clowd }
    end
  end

  # GET /clowds/1/edit
  def edit
    @clowd = Clowd.find(params[:id])
  end

  # POST /clowds
  # POST /clowds.json
  def create
    @clowd = Clowd.new(params[:clowd])

    respond_to do |format|
      if @clowd.save
        format.html { redirect_to @clowd, notice: 'Clowd was successfully created.' }
        format.json { render json: @clowd, status: :created, location: @clowd }
      else
        format.html { render action: "new" }
        format.json { render json: @clowd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clowds/1
  # PUT /clowds/1.json
  def update
    @clowd = Clowd.find(params[:id])

    respond_to do |format|
      if @clowd.update_attributes(params[:clowd])
        format.html { redirect_to @clowd, notice: 'Clowd was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clowd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clowds/1
  # DELETE /clowds/1.json
  def destroy
    @clowd = Clowd.find(params[:id])
    @clowd.destroy

    respond_to do |format|
      format.html { redirect_to clowds_url }
      format.json { head :no_content }
    end
  end
end
