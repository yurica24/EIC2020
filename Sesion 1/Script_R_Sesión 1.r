install.packages("ggplot2")
install.packages("swirl")
install.packages("lattice")
install.packages("car")
install.packages("flmport")
install.packages("tseries")


# Datasets 
iris
swiss 
tabla <- iris

calc<- 1+5

#Algunas funciones básicas
plot(iris)
plot(swiss)
summary(iris)
summary(swiss)
min(iris$Sepal.Length)

str(iris)
pie(table(iris$Species))
plot(density(iris$Sepal.Length),main="Densidad de Sepal.Length")
pairs(iris[,1:4],pch=as.numeric(iris$Species),col=iris$Species)

?pairs
?plot

#Importar datos
#install.packages("readr")
library("readr")

library(swirl)

#leer un csv
tabla1 <- read.csv("Sesion 1/swiss.csv",header = TRUE)
summary(tabla1)

#leer desde el clipboard
tabla2 <- read.table("clipboard") 

#leer escogiendo
tabla3 <- read.csv(file.choose())

#leer escogiendo archivo y descartando primeras dos lineas 
tabla4<- read.table(file.choose(), skip=5, header=TRUE, sep=";")

?read.csv

#Exportar datos 
write.table(swiss,file= "Sesion 1/swiss1.csv",sep=",",row.names=FALSE,col.names = TRUE)
write.table(swiss,file= "Sesion 1/swiss1.txt",sep=",",row.names=FALSE,col.names = TRUE)
write.table(iris, file= "Sesion 1/iris.txt", sep = ",", row.names = FALSE, col.names = TRUE)
write.table(tabla1,file= "Sesion 1/tabla1.txt",sep=",",row.names=FALSE,col.names = TRUE)
