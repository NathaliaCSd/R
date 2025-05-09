#Matrizes e Arrays

A = matrix(data = c(-3,2,893,0.17),2,2)
A

A = matrix(data=c(-3,2,893,0.17), nrow = 2, ncol = 2)
A

#Por padrao, o R preenche a matriz coluna por coluna
#para montar linha por linha 
#use byrow

matrix(data = c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = FALSE)

matrix(data = c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE)


#quando tiver varios vetores de comprimento igual
#pode criar rapidamente uma matriz ligando esses vetores usando 
#rbind e cbind
#tratando cada vetor como uma linha (rbind)
#ou tratando cada vetor como coluna (cbind)

rbind(1:3,4:6)

cbind(1:3,4:6)

#calcular a dimensao da matriz 
#numero de linhas e colunas de uma matriz
mymat = rbind(c(1,3,4),5:3,c(100,20,90), 11:13)
mymat

#retorna o numero de linhas e colunas da matriz
dim(mymat)
#retorna o numero de linhas da matriz
nrow(mymat)
#retorna o numero de colunas
ncol(mymat)
dim(mymat)

#extraindo um elemento de uma matriz 

A = matrix(c(0.3,4.5,55.3,91,0.1,105.4,-4,8.2,27.9), nrow=3,ncol=3)
A

#extrai a segunda coluna inteira
A[,2]

#extrai elemento da terceira linha e segunda coluna
A[3,2]

#primeira linha inteira
A[1,]

#segunda e terceira linhas
A[2:3,]

#terceira e primeira colunas
A[,c(3,1)]

#terceira e primeira linha das colunas 2 e 3
A[c(3,1),2:3]


#pega a diagonal da matriz
diag(x=A)

#deletar ou omitir elementos de uma matriz
#exclui a segunda coluna
A[,-2]

A[-1,3:2]

#algebra matricial 

A = rbind(c(2,5,2), c(6,1,4))
A

t(A)

t(t(A))

#matriz identidade
A = diag(x=3)
A

#multiplicacao de um escalar
A = rbind(c(2,5,2), c(6,1,4))
a = 2
a * A

#adicao e subtracao de matrizes
A = cbind(c(2,5,2), c(6,1,4))
B = cbind(c(-2,3,6), c(8.1,8.2, -9.8))
A
B

A - B


#multiplicacao de matriz
A = rbind(c(2,5,2),c(6,1,4))
dim(A)

B = cbind(c(3,-1,1), c(-3,1,5))
dim(B)

A%*%B

B%*%A

#inversa de matriz
A = matrix(data = c(3,4,1,2),2,2)
A

solve(A)

A%*%solve(A)

#multidimensional array
AR = array(data=1:24, dim=c(3,4,2))
AR

BR = array(data=rep(1:24, times=3), dim = c(3,4,2,3))
BR

AR[2,,2]

AR[2,c(3,1),2]

AR[1,,]