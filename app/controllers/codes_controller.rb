class CodesController < ApplicationController
  before_action :set_code, only: [:show, :edit, :update, :destroy]
  def scanner 
      @code=Code.new
      @cad=params[:contenido]

      unless @cad.nil? 
        
      end
      unless @cad.nil? 
        @cad=@cad.split(' ')
      end
      render 'codes/scanner'
  end 
  # GET /codes
  # GET /codes.json
  def index
    @codes = Code.all
  end

  # GET /codes/1
  # GET /codes/1.json
  def show
  end

  # GET /codes/new
  def new
    @code = Code.new
  end

  # GET /codes/1/edit
  def edit
  end

  # POST /codes
  # POST /codes.json
  def create
    @code = Code.new(code_params)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
        format.json { render :show, status: :created, location: @code }
        format.js 
      else
        format.html { render :new }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codes/1
  # PATCH/PUT /codes/1.json
  def update
    respond_to do |format|
      if @code.update(code_params)
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
        format.json { render :show, status: :ok, location: @code }
        format.js 
      else
        format.html { render :edit }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.json
  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to codes_url, notice: 'Code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code
      @code = Code.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def code_params
      params.require(:code).permit(:titulo, :codigo)
    end
    def scan (cadena)
      nivel = 0
      tokens=[[],[]]
       tabla = [["1","a","+","=",nil],
               [  2,  3,  4,  5, nil],
               [  2, nil,nil,nil,"digito"],
               [ nil, 3,nil,nil,"letra"],
               [ nil,nil,nil,nil,"+"],
               [ nil,nil,nil,6,"="],
               [ nil,nil,nil,nil,"=="]] 

        for i in 0..cadena.length
          c= cadena[i]
          puts c
          if c=="o"
           i=i+1
         end
        end
    end
end
