#solución examen 

air <- airquality

#*****************************sección 1

#*********pregunta "Utilizando el conjunto de datos "airquality" ¿Cuál es la media, mediana y moda de la variable Wind?"
#Opción 1
summary(air$Wind)
table (air$Wind)

#Opcion 2
mean(air$Wind)
median(air$Wind)
library(modeest)
mlv(air$Wind, method  =  "mfv")

#R/ Media= 9.958, Mediana=  9.7,  moda= 11.5
#R/ Opción B


#*********pregunta Utilizando el conjunto de datos "airquality" ¿Cuál es la media, mediana y moda de la variable Temp?
#Opción 1
summary(air$Temp)
table (air$Temp)

#Opcion 2
mean(air$Temp)
median(air$Temp)
library(modeest)
mlv(air$Temp, method  =  "mfv")

#R/ la media de temp es 77.88, la mediana es 79.00 y la moda es 81
#R/ Opción C

#*********pregunta: Utilizando el conjunto de datos "airquality" indique qué desviación estándar es más adecuada. ¿La de Wind o la de Ozono?

dswing <- sd(air$Wind, na.rm=TRUE)
rangowing <- range(air$Wind)
dsozone <- sd(air$Ozone, na.rm=TRUE)
rangoozono <-  range(air$Ozone, na.rm = TRUE)

#R:"La desviación estandar de Wind, con un valor de 3.52 es adecuada, ya que indica menos dispersión de los datos"


#*********Pregunta: Utilizando el conjunto de datos "airquality" grafique el histograma de la variable Ozono e indique qué tipo de asimetría tiene

hgraf<- hist(air$Ozone)
#R: Opción C: Positiva, porque tiene más valores acumulados en su parte izquierda

#*********Pregunta: Utilizando el conjunto de datos "airquality" calcule el grado de simetría de la variable SolarR. ¿Qué significa el valor de su simetría?
library(psych)
skew(air$Solar.R)

#R:Al ser una simetría negativa de -0.4193 nos indica que los valores se acumulan en la parte derecha de la gráfica


#*****************************sección 2
#*
#*
#*********Pregunta: Utilizando el conjunto de datos "diamonds" y la librería GGPLOT, diagrame una gráfica de barras con la variable color. ¿Cual es el color con mayor frecuencia?
library(ggplot2)
t<- diamonds

ggplot(data = t, aes(x = color, fill = as.factor(color))) + 
  geom_bar() + 
  xlab("Clasificacion de colores") + 
  ylab("frecuencias") + 
  ggtitle("Gráfico de Barras") +
  labs(fill = "Colores") + 
  theme_minimal()

#R:G con una frecuencia mayor a 10500

#*********Pregunta:Utilizando el conjunto de datos "diamonds" y la librería GGPLOT realice un histograma con la variable Carat en su eje X. ¿Qué tipo de simetría presenta la gráfica?

ggplot(t) + 
  geom_histogram(binwidth = 0.1, aes(x = carat), fill = 'steelblue') + 
  xlab("Carat") + 
  ylab("Frecuencia") + 
  ggtitle("Distribución de la variable Carat") +
  theme_minimal()

#R:Positiva, porque sus valores se acumulan a la izquierda de la gráfica


#*********Utilizando el conjunto de datos "diamonds" y la librería GGPLOT y realizando un diagrama de dispersión entre las variables Carat y Price indique la relación de las variables

ggplot(data = t, aes(x = carat, y = price)) + 
  geom_point(color = 'slateblue', size = 5, alpha = 0.6) +
  geom_smooth(color = 'blue') + 
  xlab('Carat') + 
  ylab('Precio') +
  ggtitle('Relación entre Carat y Precio de un diamante') + 
  theme_minimal()

#Respuesta: Existe una fuerte relación entre Carat y Price ya que la gráfica crece positivamente

#*********Utilizando el conjunto de datos "diamonds" y la librería GGPLOT y realizando un diagráma de dispersión entre las variables "Y" y "Z", indique la relación entre las variables (Seleccione 2 posibles respuestas)
#*
ggplot(data = t, aes(x = y, y = z)) + 
  geom_point(color = 'slateblue', size = 5, alpha = 0.6) +
  geom_smooth(color = 'blue') + 
  xlab('y') + 
  ylab('z') +
  ggtitle('Relación entre y y z de un diamante') + 
  theme_minimal()

#R1: Existe una fuerte relación entre Y y Z ya que una impacta a la otra
#R2:  La relación entre las variables Y y Z es muy fuerte


#*********Utilizando el conjunto de datos "diamonds" y la librería GGPLOT y realizando el diagrama de cajas entre las variables Carat y Price indique cuál de las siguientes opciones es correcta
#*
ggplot(data = t, aes(x = carat, y = price)) + 
  geom_boxplot(aes(color = carat), alpha = 0.7) + 
  xlab('carat') + 
  ylab('precio') +
  ggtitle('Carat por precio de un diamante') + 
  theme_minimal()

#R: Todas las respuestas son incorrectas


#*****************************sección 3

#*********Se ha tomado una muestra de 20 elementos, donde la probabilidad de éxito es del 60%. Calcule la probabilidad de densidad y grafique sus valores. ¿Qué tipo de sesgo se observa en los resultados?
#variables
n<-20
p<- 0.6
q<- 0.4
x <- 1:n

prob <- dbinom(x,n,p)
barplot(prob, main = "Distribucion binomial Examen 1", names.arg =x)

#R: Es un sesgo negativo porque p>0.5

#*********Una oficina de servicio al cliente recibe en promedio 20 quejas en un día. Calcule la probabilidad de densidad y grafique sus valores. ¿Qué observa en la gráfica?

#variables
lb<- 20
x <- 1:24

prob <- dpois(x, lb)
barplot(prob, main = "Distribucion de Poisson Examen 1", names.arg =x)
#R: Existe poca probabilidad que ocurra una queja en las primeras 7 horas
