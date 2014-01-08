class EditorialsController < ApplicationController
  # GET /editorials
  # GET /editorials.json
  def index
#debugger
  #   @editorials = Editorial.all
    #@editorials = Editorial.search(params[:search], params[:page])

    @editorials= Editorial.paginate(:page => params[:page],:per_page => 2)
    #binding.pry

    #logger.debug "New post: #{@editorials.inspect}"
    #logger.debug "New post: #{@editorials.to_yaml}"
    #logger.info "Processing the request..."
    #logger.fatal "Terminating application, raised unrecoverable error!!!"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @editorials }
    end
  end

  # GET /editorials/1
  # GET /editorials/1.json
  def show
    @editorial = Editorial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @editorial }
      format.vcard { render :text => 'hi this my custom mime type' }
    end
  end

  # GET /editorials/new
  # GET /editorials/new.json
  def new
    @editorial = Editorial.new
    #binding.pry
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @editorial }
    end
  end

  # GET /editorials/1/edit
  def edit
    @editorial = Editorial.find(params[:id])
  end

  # POST /editorials
  # POST /editorials.json
  def create
    @editorial = Editorial.new(params[:editorial])
    #debugger
    #binding.pry

    respond_to do |format|
      if @editorial.save
        format.html { redirect_to @editorial, notice: 'Editorial was successfully created.' }
        format.json { render json: @editorial, status: :created, location: @editorial }
      else
        format.html { render action: "new" }
        format.json { render json: @editorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /editorials/1
  # PUT /editorials/1.json
  def update
    @editorial = Editorial.find(params[:id])

    respond_to do |format|
      if @editorial.update_attributes(params[:editorial])
        format.html { redirect_to @editorial, notice: 'Editorial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @editorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editorials/1
  # DELETE /editorials/1.json
  def destroy
    @editorial = Editorial.find(params[:id])
    @editorial.destroy

    respond_to do |format|
      format.html { redirect_to editorials_url }
      format.json { head :no_content }
    end
  end
end
