#Sesión 2
#Software para la interpretación y análisis de la información para la investigación científica 
#Sección A

#Estadística descriptiva 
# Medidas de Tendencia Central
# Medidas de Dispersión
# Medidas de apuntamiento y asimetría 

#Para esta sesión utilizaremos el conjunto trees, para ver su contenido solo deben escribir 
 trees

 #se puede obtener un resumen de medidas con la función Summary. Tiene tres variables Girth, Height y Volume
 summary(trees)
 
 #**********Medidas de tendencia central**********
 
 
 #Calculando la media 
	#circunferencia
	mean(trees$Girth)
	#altura
  mean(trees$Height)
	#	Volume
	mean(trees$Volume)
  
  #mediana	
  median(trees$Height, na.rm = TRUE)
  
 #para trabajar la media no hay una formula nativa, por lo que si son pocos datos podemos hacerlo por observación 
	data1<- c(5, 4, 2, 6, 2, 1, 3, 4, 6, 7, 4)
	#La función table () devuelve una tabla con el número de diferentes valores de x (típicamente para enteros o	factores)
 
	?table
	table(data1)
	#esto nos devuelve que la variable con mayor frecuencia es 4
 
  #para la moda hay que instalar la libreria ModeEst (quitar el signo # si no lo ha instalado)
  #install.packages("modeest")
  library(modeest)
  
  #En caso de error la instalación o el uso de la variable correr las siguientes lineas
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
	BiocManager::install("genefilter", version = "3.9")
  
  
  #utilizando el data set trees podemos contar por observacion la moda
  table(trees$Girth)
  table(trees$Height)
  
  #pero es algo dificil cuando hay muchos datos, por ello podemos utilizar la siguiente instrucción
  #mfv=  most frecuent value o valor más frecuente 
  mfv(trees$Girth) 
  mfv(trees$Height)
  
  #o podemos utilizar el metodo mlv (most likely value) 
  mlv(trees$Girth, method  =  "mfv")
  mlv(trees$Height, method  =  "mfv")
  
  
  #plus Quantiles
  quantile(trees$Girth, 0.8)
  
#*********Medidas de Dispersión*************#  
 
  #rango, max y min 
  range(trees$Girth)
  max(trees$Girth)
  min(trees$Girth)
  
   #varianza y desviación 
 var(trees$Girth)
 var(trees$Height)

 sd(trees$Girth)
  
 sd(trees$Height)
  
#**************Medidas de forma***************
  #curtosis y asimetria
 #Curtosis nos da el achatamiento de la distribucion de los datos de la variable x.
 #Skew nos da el valor de la asimetria de los datos de la variable x
 
  #install.packages("psych")
  library(psych)
  
  table(trees$Girth)
  table(trees$Height)
  
  skew(trees$Girth)
  kurtosi(trees$Girth)
   
  skew(trees$Height)
  kurtosi(trees$Height)
  mardia(trees$Height, plot= TRUE)
  #plot(trees$Height)
  
  
x <- c(2,3,4,5,6,7,8,9)
y <- c(1,5,28,70,89,33,16,8)  
curtosis <- data.frame(cbind(x,y))
curtosis  
kurtosi(curtosis)
?kurtosi
mardia(curtosis, plot = TRUE)
