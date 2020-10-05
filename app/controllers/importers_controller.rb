class ImportersController < ApplicationController
  # List all operations
  def index
    @importers = Importer.all
  end

  # Creates a new object  
  def new
    @importer = Importer.new
  end
  
  def create
    begin
      @importer = Importer.new
      raise "Por favor, selecione um arquivo" if permitted_params[:file].blank?
      @importer.file.attach(permitted_params[:file])

      @importer.save!

      CnabImportService.new(@importer).process

      set_flash_message(:sucess, "Arquivo salvo com sucesso!")
      redirect_to importers_path
    rescue Exceprion => e
      set_flash_message(:alert, e.message)
      render :new
    end
  end

  private
  
  def permitted_params
    params.require(:importer).permit(:file)
  end
end
