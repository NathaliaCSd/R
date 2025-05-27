#loops
#estrura basica for(i in conjunto_de_valores){ }

for (i in 1:10) {
  print(i)
}

#imprimindo na tela 5 primeiras letras do alfabeto 
#R tem um vetor com as letras: letters
for (i in 1:5) {
  print(letters[i])
}

#imprmindo uma string com um conjunto de anos
for (i in 2020:2025) {
  print(paste("Este eh o ano de", i))
}

#imprimindo os numeros que nao sejam pares de 1 e 10
#comando next 
for (i in 1:10) {
  if(!i %% 2){
    next
  }
  print(i)
}