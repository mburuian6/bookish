class PdfsController < ApplicationController
  before_action :set_pdf, only: %i[ show edit update destroy read_pdf]
  before_action :set_last_accessed, only: %i[ update ]

  # GET /pdfs or /pdfs.json
  def index
    @pdfs = Pdf.all
  end

  # GET /pdfs/1 or /pdfs/1.json
  def show
  end

  # GET /pdfs/new
  def new
    @pdf = Pdf.new
  end

  # GET /pdfs/1/edit
  def edit
  end

  # POST /pdfs or /pdfs.json
  def create
    @pdf = Pdf.new(pdf_params)
    set_last_accessed
    respond_to do |format|
      if @pdf.save
        format.html { redirect_to pdf_url(@pdf), notice: "Pdf was successfully created." }
        format.json { render :show, status: :created, location: @pdf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pdfs/1 or /pdfs/1.json
  def update
    respond_to do |format|
      if @pdf.update(pdf_params)
        format.html { redirect_to pdf_url(@pdf), notice: "Pdf was successfully updated." }
        format.json { render :show, status: :ok, location: @pdf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdfs/1 or /pdfs/1.json
  def destroy
    @pdf.destroy

    respond_to do |format|
      format.html { redirect_to pdfs_url, notice: "Pdf was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def read_pdf
    render 'show', flash[:notice] => 'no pdf attached' and return unless @pdf.pdf_attachment.attached?

    if params[:newpage]
      new_page = params[:newpage]
      new_page = new_page.to_i.abs

      # TODO: Compare page numbers before processing
      @pdf.update(current_page: new_page)
    end

    @pdf_attachment = Base64.encode64(@pdf.pdf_attachment.download)
  end

  def save_page
    page = JSON.parse(params[:page])
    @pdf = Pdf.find(params[:pdf_id])
    @pdf.current_page = page.to_i
    @pdf.save
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pdf
    @pdf = Pdf.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pdf_params
    params.require(:pdf).permit(:title, :pdf_attachment)
  end

  def set_last_accessed
    @pdf.last_accessed = DateTime.now
  end
end
