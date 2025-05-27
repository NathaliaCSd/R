#vetores
#funcao c --concatenar 

vetor = c(1,3,1,42)
vetor

#eh possivel juntar uma VARIAVEL a um VETOR
x = 32.1
vetor1 = c(3,-1,-3.43, 1e+03, x)
vetor1

#eh possivel tambem JUNTAR dois vetores
vetor3 = c(vetor1,vetor)


#comandos para criar, ordenar e calcular tamanho de VETORES


#comando para criar o vetor de uma sequencia de valores
# :
vetor5 = 3:27
vetor5

#ou
# seq

seq(from=3,to=27,by=3)

seq(from=3,to=27,length.out = 40)


foo = 5.3
vetor5 = seq(from=foo, to=(-47+1.5), by=-2.4)
vetor5

#criar uma sequencia/vetor 
#rep

#times repete o vetor
rep(x=1, times=4)

rep(x=c(3,62,8.3),times=3)

rep(x=c(3,62,8.3), each = 2)
#each repete os elementos do vetor


rep(x=c(3,62,8.3), times=3, each=2)

num = 4
c(3,8.3,rep(x=32,times=num), seq(from=-2,to=1, length.out = num+1))


#ORDENAR um vetor 
#sort
#do maior para o menor ou do menor para o maior 

sort(x=c(2.5,-1,-10,3.44), decreasing = FALSE)

sort(x=c(2.5,-1,-10,3.44), decreasing = TRUE)


ord = seq(from=4, to=5.5, length.out = 8)


#encontrar o TAMANHO do vetor

x = c(3,2,8,1)
length(x)

length(x= 5:13)


#extraindo subelementos de um vetor
vetor7 = c(5,-2.3,4,4,4,6,10,8,40221,-8)
length(x=vetor7)

vetor7[1]
vetor7[2]

vetor7.len = length(x=vetor7)
bar = vetor7[vetor7.len-1]
1:vetor7.len

#excluir um elemento do vetor 
#usando versao negativa do indice 

vetor7[-1]
#exclui o primeiro elemento do vetor 

vetor7
ex = vetor7[-2]
ex

#juntando os pedacos de vetor7 com ex e bar
c (ex[-length(x=ex)], bar, ex[length(x=ex)])


vetor7[c(1,3,5)]
#retorna o primeiro, terceiro e quinto elementos do vetor

ret = vetor7[1:4]
ret

indexes = c(4,rep(x=2,times=3), 1,1,2,3:1)
indexes

#reescreve certos elementos do vetor
bar = c(3,2,4,4,1,2,4,1,0,0,5)
bar

bar[1] = 6;
bar

#substitui o segundo, quarto e sexto elemento
bar[c(2,4,6)] = c(-2,-0.5,-1)
bar

#operacoes com vetores
foo = 5.5:0.5
foo 

foo - c(2,4,6,8,10,12)

baz = c(1,-1,0.5,-0.5,1,1)
foo*baz

qux = 3
foo + qux

#mesma coisa que fazer 
foo + rep(x=3,times=length(x=foo))

#soma de todos os elementos do vetor
sum(foo)

#produto de todos os elementos do vetor
prod(foo)


