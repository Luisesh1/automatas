class CodesController < ApplicationController
  before_action :set_code, only: [:show, :edit, :update, :destroy]
  def scanner 
      @code=Code.new
       @tock=nil
      @cad=params[:contenido]
      unless @cad.nil? 
       @tock= scan(@cad)
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
  nivel = 1
  acomulado=""
  tokens=[]
   @tabla = [[/\d/,/[a-zA-Z]/,/\+/,/=/,/{/,/}/,/\s/,/;/, nil],
           [    2,      3,      4,  5  ,7,  8,  9,   10,  nil],
           [    2,     nil,    nil,nil,nil,nil,nil, nil, "numero"],
           [   nil,     3,     nil,nil,nil,nil,nil, nil, "ID"],
           [   nil,    nil,    nil,nil,nil,nil,nil, nil, "+"],
           [   nil,    nil,    nil, 6 ,nil,nil,nil, nil, "="],
           [   nil,    nil,    nil,nil,nil,nil,nil, nil, "=="],
           [   nil,    nil,    nil,nil,nil,nil,nil, nil, "{"],
           [   nil,    nil,    nil,nil,nil,nil,nil, nil, "}"],
           [   nil,    nil,    nil,nil,nil,nil,nil, nil, nil], 
           [   nil,    nil,    nil,nil,nil,nil,nil, nil, ";"]] 
    i=0
    while (i<cadena.length)
      c= cadena[i]
      unless isValido(c)
          puts "se encontro caracter invalido"
          tokens=nil
          return
      end
      if @tabla[nivel][pos(c)].nil? 
        tokens.push(valor:acomulado,tipo:@tabla[nivel][@tabla[nivel].length-1]) unless @tabla[nivel][@tabla[nivel].length-1].nil?
        acomulado=""
        nivel=1
      else
          nivel=@tabla[nivel][pos(c)]
          i+=1
          acomulado+=c
      end
    end
    tokens.push(valor:acomulado,tipo:@tabla[nivel][@tabla[nivel].length-1])
    tokens
end
 def pos(c)
  posi=0
  col = @tabla.length-1
  @tabla[0].each do |l|
    unless c.match(l).nil?
      col=posi 
      return col
    end
    posi+=1
  end
  col
end
def isValido(l)
    @tabla[0].each do |c|
        unless c.match(l).nil?
            return true
        end
    end
    return false
end
end
