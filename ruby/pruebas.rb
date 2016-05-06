
def scan (cadena)
  nivel = 1
  acomulado=""
  tokens=[[],[]]
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
          return
      end
      if @tabla[nivel][pos(c)].nil? 
        tokens.push(acomulado,@tabla[nivel][@tabla[nivel].length-1]) unless @tabla[nivel][@tabla[nivel].length-1].nil?
        acomulado=""
        nivel=1
      else
          nivel=@tabla[nivel][pos(c)]
          i+=1
          acomulado+=c
      end
    end
    tokens.push(acomulado,@tabla[nivel][@tabla[nivel].length-1])
    puts tokens
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

   scan ("a = b;")
    #puts pos("1")
    