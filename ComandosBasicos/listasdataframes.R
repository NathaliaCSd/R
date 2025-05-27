#listas e dataframes 

#guardar mais um tipo de dado 

foo = list(matrix(data=1:4,2,2), c(T,F,T,T), "hello")
foo

length(foo)

foo[[1]]

foo [[3]]

foo[[1]] + 5.5

foo[[1]][1,2]

cat(foo[[3]], "you!")

foo[[3]] = paste(foo[[3]], "you!")
foo


#eh possivel dar  nome aos elementos da list
names(foo) = c("minhamatriz", "minhalogica", "meustring")
foo

#e assim eh possivel chamalos pelo nome usando o comando com $
foo$minhamatriz

foo$minhalogica

foo$minhalogica

all(foo$minhamatriz[,2] == foo[[1]][,2])


#Data Frames
#forma mais comum de apresentar dados no R
#dados agrupados, com o mesmo tamanho

mydata = data.frame(person=c("Peter","Lois","Meg","Chris","Stewie"),
                    age=c(42,40,17,14,1),sex=factor(c("M","F","F","M","M")),
                    stringsAsFactors = FALSE)
mydata

mydata$Nome


#Adicionando dados ao data.frame

newrecord = data.frame(person="Brian",age=7,sex=factor("M",levels=levels(mydata$sex)))
newrecord


mydata = rbind(mydata,newrecord)
mydata


funny = c("High","High","Low","Med","High","Med")
funny = factor(x=funny,levels=c("Low","Med","High"))
funny


mydata = cbind(mydata,funny)
mydata
