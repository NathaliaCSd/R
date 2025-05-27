#caracteres no R
#tipo string 

foo = "isso eh uma string"
foo
length(foo)

#R trata string como um vetor unitario 

nchar(foo)

bar = "23.3"
bar

"alpha" == "alpha"

"alpha" != "beta"

c("alpha", "beta", "gamma") == "beta"

#como contatenar 
#cat 
qux = c("Programacao", "R", "e")
length(qux)

qux

cat(qux[1], "em", qux[3], qux[1], "legal!")

a = 3
b = 4.4

cat("o valor guardado em 'a' e", a,".", sep = "")

#ou paste
paste(qux[1], "em", qux[3], qux[1], "legal!")

paste("o valor guardado em 'b' e ",b,".", sep = "")

cat(" eu quero um cachorro\nsplit\tto neww\b\n\n\tlines")