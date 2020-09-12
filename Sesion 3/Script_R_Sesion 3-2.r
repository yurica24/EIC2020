#Sesión 3
#Software para la interpretación y análisis de la información para la investigación científica 
#Sección A

#paquete Ggplot2, el cual ya hemos instalado previamente
#si no ha instalado dicho paquete corra la siguiente instrucción

#install.packages('ggplot2')

#llamamos o 'seteamos' la librería
library(ggplot2)
?ggplot2
  

#ggplot2 tiene varios elementos
#1. Datos (fuente)
#2. Estéticas "el qué"
#3. Capas "el cómo"
#4. Facetas
#5. Temas


#1. Datos: GGplot, a diferencia de los gráficos normales, utiliza un dataframe en lugar de un vector
#utilizando el conjunto iris

hist(iris$Sepal.Length)
ggplot(iris)
#indicando unicamente el dataframe no es suficiente para graficar, necesitamos más elementos

#2. Estética: se entenderá como los elementos de la gráfica, columnas, colores, distancia, ejes, etc.
#es el "qué" en esta ecuación
#la instrucción a añadir es aes(x = Petal.Length, y = Petal.Width, colour = Species)

p<- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species))  
#cargué a la variable p los detalles de ggplot, aún no podemos graficar, ya que le faltan capas.  

#también podemos agregar otras estéticas como titulo y nombre de los ejes. 
p <- p + ggtitle("Ancho y largo de petalos") + 
  labs(x = "Largo de petalos", 
       y = "Ancho de petalos", 
       colour = "Species")

#3. Capas
#Las capas (o geoms para ggplot2) son los verbos del lenguaje de los gráficos. 
#Indican qué hacer con los datos y las estéticas elegidas, cómo representarlos en un lienzo.
#es el "cómo"
#la instrucción a añadir es geom_point()

#cuando queremos unir algo a una variable u objeto utilizamos el signo +

p <- p + geom_point()

#esto ya lo podemos graficar y para ello convocamos a la variable p
p


#usualmente no se hace por partes y se escribe directamente así 
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + 
  geom_point()


#la ventaja de ggplot son sus capas, las cuales pueden superponerse, la instrucción a continuación
#añade al gráfico una curva suavizada (smooth) (con sus intervalos de confianza en gris).
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + 
  geom_point() + geom_smooth()

#para conocer la amplia gama de capas que ggplot2 posee visitar 
#http://docs.ggplot2.org/current/

#ggplot puede ademas guardar el grafico con una instrucción 
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + geom_point()
ggsave("mi_grafico.png")

#por ultimo, tenemos un elemento que diferencía a ggplot de las graficas normales. Las fasetas
#4. Facetas
#Las facetas implementan los gráficos de Trellis.Una característica de estos gráficos, 
#que es crítica para poder hacer comparaciones adecuadas, es que comparten ejes.

ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point() + geom_smooth() + 
  facet_grid(~ Species)

#la grafica puede obtenerse facilmente de forma horizontal modificando (~ Species) por (Species ~ .)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point() + geom_smooth() + 
  facet_grid(Species ~ .)


#5 Temas:
#Los temas de ggplot2 permiten modificar aspectos estéticos del gráfico que no tienen que ver con los datos en sí. 
#Eso incluye los ejes, etiquetas, colores de fondo, el tamaño de los márgenes, etc. 
p <- p + theme_bw()
p
#existen mas de 40 elementos modificables en theme, pero quedan fuera del alcance del curso. 

#Recordemos los elementos importantes de una gráfica en ggplot
#1. Datos
#2. Estéticas
#3. Capas
#4. Facetas
#5. Temas


#graficas de una variable, son aquellas que involucran solo un vector. tales como 
#histogramas
#Barras
#entre otras


#barras antes y con ggplot
t <- read.table("Sesion 3/data/bank.csv", header = T, sep = ";")

plot(x = iris$Species, main = "Gráfica de Educación",
     xlab = "Especies", ylab = "Frecuencia", 
     col = c("royalblue", "seagreen", "purple", "grey"))

ggplot(t, aes(x = education)) + 
  geom_bar(color = 'darkslategray', fill = 'steelblue') + 
  xlab("nivel educativo") + 
  ylab("frecuencias") + 
    ggtitle("Gráfico de Barras")

#con mas detalles
ggplot(data = t, aes(x = education, fill = as.factor(education))) + 
  geom_bar() + 
  xlab("Nivel educativo") + 
  ylab("frecuencias") + 
  ggtitle("Gráfico de Barras") +
  labs(fill = "Nivel") + 
  theme_minimal()


#histogramas antes y después
hist(x = t$age)

ggplot(t) + 
  geom_histogram(binwidth = 5, aes(x = age), fill = 'steelblue') + 
  xlab("Edad") + 
  ylab("Frecuencia") + 
  ggtitle("Distribución de la variable edad") +
  theme_minimal()


#el parametro bindwidth permite definir el nivel de detalle de la gráfica, hist no permite eso
ggplot(t) + 
  geom_histogram(binwidth = 1, aes(x = age), fill = 'steelblue') + 
  xlab("Edad") + 
  ylab("Frecuencia") + 
  ggtitle("Distribución de la variable edad") +
  theme_minimal()

#por color según job o marital
ggplot(t) + 
  geom_histogram(binwidth = 5, aes(x = age, fill = job)) + 
  xlab("Edad") + 
  ylab("Frecuencia") + 
  ggtitle("Distribución de la variable edad") +
  theme_minimal()

ggplot(t) + 
  geom_histogram(binwidth = 5, aes(x = age, fill = marital)) + 
  xlab("Edad") + 
  ylab("Frecuencia") + 
  ggtitle("Distribución de la variable edad") +
  theme_minimal()


#dispersión
plot(x = iris$Petal.Length, y = iris$Petal.Width, col = iris$Species, 
     main = "Iris - Pétalo", xlab = "Largo", ylab = "Ancho")
legend(x = "topleft", legend = c("Setosa", "Versicolor", "Virginica"), 
       fill = c("black", "red", "green"), title = "Especie")


ggplot(data = iris, aes(x = iris$Petal.Length, y = iris$Petal.Width)) + 
  geom_point(color = 'slateblue', size = 2, alpha = 0.6) +
  geom_smooth(color = 'red') + 
  xlab('largo') + 
  ylab('ancho') +
  ggtitle('Relación entre ancho y largo de una iris') + 
  theme_minimal()
library(ggplot2)
ggplot(data = iris, aes(x = iris$Petal.Length, y = iris$Petal.Width)) + 
  geom_point(color = 'slateblue', size = 2, alpha = 0.6) +
  geom_smooth(color = 'red') + 
  facet_grid(iris$Species~., scales = 'free')+
  xlab('largo') + 
  ylab('ancho') +
  ggtitle('Relación entre ancho y largo de una iris') + 
  theme_minimal()


#cajas y bigotes
plot(x = t$education, y = t$age, main = "Edad por nivel educativo", 
     xlab = "Nivel educativo", ylab = "Edad", 
     col = c("orange3", "yellow3", "green3", "grey"))


#vamos por pasos, diagramamos la distribución de edades en función del nivel educativo
ggplot(data = t, aes(x = education, y = age)) + 
  geom_point(aes(color = education), size = 1, alpha = 0.7) +
  xlab('nivel educativo') + 
  ylab('edad') +
  ggtitle('Edad por nivel educativo') + 
  theme_minimal()

#paso 2: geom_jitter(), una dispersión horizontal y al azar de los datos
ggplot(data = t, aes(x = education, y = age)) + 
  geom_jitter(aes(color = education), size = 1, alpha = 0.7) +
  xlab('nivel educativo') + 
  ylab('edad') +
  ggtitle('Edad por nivel educativo') + 
  theme_minimal()


#paso 3, diagramamos las cajas que permiten explicar mejor la teoria de esta gráfica
#la función es geom_boxplot
ggplot(data = t, aes(x = education, y = age)) + 
  geom_jitter(aes(color = education), size = 1, alpha = 0.7) +
  geom_boxplot(aes(color = education), alpha = 0.7) + 
  xlab('nivel educativo') + 
  ylab('edad') +
  ggtitle('Edad por nivel educativo') + 
  theme_minimal()

#para entender mejor el diagrama de cajas
#https://www.khanacademy.org/math/statistics-probability/summarizing-quantitative-data/box-whisker-plots/a/box-plot-review

#usualmente para diagramar una caja, se usa directamente la función geom_boxplot
#los pasos anteriores fueron con caracter ilustrativo 

ggplot(data = t, aes(x = education, y = age)) + 
  geom_boxplot(aes(color = education), alpha = 0.7) + 
  xlab('nivel educativo') + 
  ylab('edad') +
  ggtitle('Edad por nivel educativo') + 
  theme_minimal()


#la magia de las capas, tres gráficas en una, jitter, violin y boxplot

ggplot(data = t, aes(x = education, y = age)) + 
  geom_jitter(size = 1, color = 'gray', alpha = 0.5) + 
  geom_violin(aes(fill = education), color = 'black', alpha = 0.8) +
  geom_boxplot(color = 'black', alpha = 0.7) +  
  xlab('nivel educativo') + 
  ylab('edad') +
  ggtitle('Edad por nivel educativo') + 
  theme_minimal()
