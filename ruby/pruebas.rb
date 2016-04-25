
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
          puts "nivel #{nivel}"
          puts "nivel #{pos(c)}"
          nivel = @tabla[nivel][pos(c)]
          if nivel.nil? 
            puts acomulado 
            puts @tabla[2][5]
            tokens.push([acomulado],[])
            acomulado=""
            puts tokens
          end
          i+=1
          acomulado+=c
        end
 
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

    scan ("111j11")