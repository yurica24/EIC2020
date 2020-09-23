#Tarea1


#cargar el archivo
dataset1 <- read.csv(file = "Tareas/Car.csv", h=TRUE)

#1 ¿Cuál es la velocidad promedio en la Categoría Speed1? 

prom_speed1 <- mean(dataset1$speed1)
prom_speed1
#[1] 84.66695


#2. ¿Cuál es el tipo más frecuente en la categoría Type4?

opcion1 <- table(dataset1$type4)
opcion1
#1862 - Van

library(modeest)
Opcion2 <-  mlv(dataset1$type4, method  =  "mfv")
Opcion2
# "van"

#3. La curtosis (kurtosi(x)) me indica el grado de asimetría de un conjunto de datos 
#Falso. La curtosis mide el nivel de apuntamiento de un conjunto 


#4.¿La desviación estándar en la Polución tipo 3 y 5 (pollution3 y pollution5) es?

dsTipo3 <- sd(dataset1$pollution3)
dsTipo5 <- sd(dataset1$pollution5)
dsTipo3
dsTipo5
#> dsTipo3  [1] 0.2034444  > dsTipo5  [1] 0.2659942

#5 	5. Determina qué tan dispersos están los datos con respecto a la media
#R/ Desviación estándar
