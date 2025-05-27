#valores nao numericos
#valores logicos podem ser TRUE ou FALSE
#T ou F

foo = TRUE
foo 

bar = F
bar

baz = c(T,F,F,F,T,F,T,T,T,F,T,F)
baz

qux = matrix(data=baz,3,4,byrow = foo)
qux

1 == 2

1 > 2

(2-1) <= 2

1 != (2+3)

foo = c(3,2,1,4,1,2,1,-1,0,3)
bar = c(4,1,2,1,1,0,0,3,0,4)
length(x=foo) == length(x=bar)

foo == bar

foo < bar

foo <= bar

foo <= (bar + 10)

baz = foo[c(10,3)]
baz

foo > baz

foo < 3

foo.mat = matrix(foo,5,2)
foo.mat

bar.mat = matrix(bar,5,2)
bar.mat

foo.mat <= bar.mat

foo.mat <3

qux = foo == bar
qux

#retorna TRUE se pelo menos um valor logico é TRUe
any(qux)

#retorna TRUE se todos os valores sao TRUE
all(qux)

#trabalhar com condicionantes AND(&) e OR (|)
(6 < 4) || (3 != 1)

#funcao which toma um vetor logical como um argumento x e retorna o indice correspondente
#a posicao de qualquer ou todos os elementos TRUE
which(x=c(T,F,F,T,T))

which(x=myvec < 0)

myvec[-which(x=myvec<0)]

#which tambem serve para identificar indices numericos ou logicos

which(x=A>25)

which(x=c(A[,1], A[,2],A[,3]) > 25)