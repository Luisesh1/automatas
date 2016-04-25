
def scan (cadena)
  nivel = 1
  acomulado=""
  tokens=[[],[]]
   @tabla = [["1","a","+","=",nil],
           [  2,  3,  4,  5, nil],
           [  2, nil,nil,nil,"digito"],
           [ nil, 3,nil,nil,"letra"],
           [ nil,nil,nil,nil,"+"],
           [ nil,nil,nil,6,"="],
           [ nil,nil,nil,nil,"=="]] 
    i=0
    while (i<cadena.length)
      c= cadena[i]
      unless isValido(c)
          puts "se encontro caracter invalido"
          return
      end
      puts "nivel #{nivel}"
      puts "col #{pos(c)}"
      if @tabla[nivel][pos(c)].nil? 
        #puts acomulado 
        #puts @tabla[2][5]
        tokens.push(acomulado,@tabla[nivel][@tabla[nivel].length-1])
        acomulado=""
        puts "toquen encontrado"
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
    if l==c
      col=posi 
    end
    posi+=1
  end
  col
end
def isValido(l)
    @tabla[0].each do |c|
        if c==l
            return true
        end
    end
    return false
end

    scan ("111aaaa11111111aaaa+===aaaa")
    #puts pos("1")