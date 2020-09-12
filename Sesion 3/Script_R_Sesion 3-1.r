#Sesión 3
#Software para la interpretación y análisis de la información para la investigación científica 
#Sección A

#dataset obtenido de https://archive.ics.uci.edu/ml/index.php 
#Nombre del dataset:  Bank Marketing
#contiene información de personas contactadas en una campaña de marketing directo puesta en marcha 
#por un banco de Portugal.


#Se descarga el archivo
download.file(url = "https://raw.githubusercontent.com/jboscomendoza/r-principiantes-bookdown/master/datos/bank.csv", destfile = "bank.csv")

#readLines nos permite ver un número específico de líneas, esto nos permite dar un vistazo al archivo y así decidir cómo cargarlo
readLines("bank.csv", n = 4) 


#cargamos a una variable (dataframe) el conjunto de datos adquiridos. 
banco <- read.csv(file = "bank.csv", sep = ";")

#la función head nos permite conocer los encabezados del archivo 
head(banco)

#la función dim nos permite conocer las dimensiones de la tabla (número de columnas y número de registros)
dim(banco)


#si no conocemos qué tipo de dato es cada columna, podemos obtenerlo con lapply y la función class
lapply(banco, class)


#y el clasico summary para terminar de conocer el conjunto de datos 
summary(banco)

#función plot genéica y sus atributos
?plot



#diagrama de barras
#Una gráfica de este tipo nos muestra la frecuencia con la que se han observado los datos de una variable nominal, 
#con una barra para cada categoría de esta variable.

plot (table(iris$Sepal.Length), type= "b")
plot (x=table(banco$education))


#un diagrama de barras utiliza variables nominales, esto quiere decir que no es numérico, si intentamos diagramar 
#una variable discreta (numerica) no se vería bien 
plot(banco$age )
plot(banco)


#modificando las caracteristicas con main, xlab, ylab y col 
plot(x = table(banco$education), main = "Gráfica de Educación",
     xlab = "Nivel educativo", ylab = "Frecuencia", 
     col = c("royalblue", "seagreen", "purple", "grey"))

#diagrama de barras apliladas con la función barplot()
#barras apiladas nos muestra la relación de 2 o más variables, por ejemplo, educación y prestamo. 

#en primer lugar, barplot necesita una matriz como argumento, esto quiere decir, que necesitamos crearla a traves de la 
#función table (), la cual nos muestra un conteo por categoría de una variable discreta (educación)
?table
table(banco$education)
barplot(table(banco$education))

#para crear un arreglo de dos o más variables, se debe crear un objeto al cual cargar la información, dicho objeto se llamará tab_banco

tab_banco <- table(banco$loan, banco$education)
tab_banco

#el cual hace una relación entre el nivel de educación y la obtención de un prestamo. 
#utilizando barplot con parametro de entrada tab_banco
?barplot

barplot(tab_banco)

#si fueran proporciones se utiliza prop.table con un margen de 2
ptab_banco <- prop.table(tab_banco, margin = 2)
barplot(ptab_banco)

#colocando propiedades a las caracteristicas 

barplot(ptab_banco,  main = "Préstamos por nivel educativo",
        xlab = "Nivel educativo", ylab = "Proporción", 
        col = c("royalblue", "grey"))


#colocando leyenda a las barras con la función legend
?legend

legend(x = "topright", legend = c("No", "Yes"), fill = c("royalblue", "grey"), 
       title = "Prestamo")


#histográmas
#Un histograma es una gráfica que nos permite observar la distribución de datos numéricos usando barras, 
# Cada barra representa el número de veces (frecuencia) que se observaron datos en un rango determinado.
#utiliza un vector numérico, si el vector no es numérico, dará un error. 
?hist

plot(banco$age)
hist(x = banco$age)
#error, education no es numérico.
hist(x= banco$education)

#la función permite modificar algunas de sus caractericas como el nombre con main y los ejes con xlab o ylab

hist(x = banco$age, main = "Histograma de Edad", 
     xlab = "Edad", ylab = "Frecuencia")

#colocando color a las barras 
hist(x = banco$age, main = "Histograma de Edad", 
     xlab = "Edad", ylab = "Frecuencia",
     col = "purple")



#diagrama de dispersión. 
#Este tipo de gráfico es usado para mostrar la relación entre dos variables numéricas continuas, usando puntos. 
#Cada punto representa la intersección entre los valores de ambas variables.
#requiere dos vectores numéricas continuas 

#utilizaremos el dataset de IRIS. 

plot(x=iris$Petal.Length, y= iris$Petal.Width)


#podemos ver que existe una fuerte relación entre sus variables. Lo que no ocurre con el data set anterior. 
plot(x = banco$age, y = banco$balance)


#colocando caracteristicas 
plot(x = iris$Petal.Length, y = iris$Petal.Width, col = iris$Species, 
     main = "Iris - Pétalo", xlab = "Largo", ylab = "Ancho")
legend(x = "topleft", legend = c("Setosa", "Versicolor", "Virginica"), 
       fill = c("black", "red", "green"), title = "Especie")


#diagrama de sectores o pie
?pie

pie(tab_banco)

tab_iris = table (iris$Species)
tab_iris
pie(tab_iris)
#con caracteristicas
pie (tab_iris, main= "tipos de flores", col= c("red","pink","green"))


#diagrama de cajas
#gráficos que muestra la distribución de una variable usando cuartiles, 
#de modo que de manera visual podemos inferir algunas cosas sobre su dispersión, ubicación y simetría.
#Al rango entre el primer y tercer cuartil se le conoce como intercuartílico (RIC)

#podemos utilizar una mezcla de variables nominales y cardinales 

plot(x = banco$age, type="o")
#con caracteristicas
plot(x = iris$Petal.Length, y = iris$Petal.Width, col = iris$Species, 
     main = "Iris - Pétalo", xlab = "Largo", ylab = "Ancho")
legend(x = "topleft", legend = c("Setosa", "Versicolor", "Virginica"), 
       fill = c("black", "red", "green"), title = "Especie")

#función boxplot
#argumentos para una sola caja
?boxplot

boxplot(x = banco$age, col= c("green"))

#si queremos diagramar varias categorias o cajas 
boxplot(formula = age ~ education, data =  banco)
#donde 
#formula: Para esta función las fórmulas tienen el formato y ~ x, donde x es el nombre de la variable continua a graficar, y la x es la variable que usaremos como agrupaci?n.
#data: Es el data frame del que serán tomadas las variables.





#distribución de probabilidades

#distribución binomial
?dbinom
#podemos observar los diferentes métodos y atributos necesarios. 

#ejemplo: lanzamiento de una moneda 10 veces donde su probabilidad de acierto es cara o escudo 

xbinomial <- 1:10
dbinomial <- dbinom(xbinomial, 10, 0.5)
qbinom(prob,n,p)
dbinomial
barplot(dbinomial, main = "Distribucion binomial simetrica")
pbinom(x,n,p)

#con sesgo negativo, la moneda tiene carga en cara o en escudo
n=9; 
p=.7; 
x=0:n; 
prob=dbinom(x,n,p);
barplot(prob, main = "Distribución binomial sesgo negativo")

#con sesgo positivo 
n=9; 
p=.3; 
x=0:n; 
prob=dbinom(x,n,p); 
barplot(prob, main = "Distribucion binomial sesgo positivo")

plot (x, prob, type="b")
qbinom(prob,n,p)
prob

pbinom(x,n,p)


#simulación
R<- rbinom(1000,8,.5)
R
xVal<-names(table(rbinom(1000,8,.5)))
barplot(as.vector(table(rbinom(1000,8,.5))),names.arg =xVal,
          main="Simulated Binomial Distribution\n (n=8,p=0.5)")



#distribución de poisson
#atributos de la distribución poisson
?dpois
#ejemplo Número de entradas a una página web, en promedio se reciben 10 entradas en una hora
xpoisson= 1:60
lambda= 10

distpoison <- dpois(xpoisson, lambda)

distpoison

 
plot (xpoisson, distpoison, type="h", col=c("orange", "yellow", "gray"), xlab = xpoisson)
barplot(distpoison)


#lambda =  30
lambda= 30
distpoison <- dpois(xpoisson, lambda)
plot (xpoisson, distpoison, type="h", col=c("orange", "yellow", "gray"), xlab = xpoisson)
barplot(distpoison)








 #distribución Normal. Utilizaremos la función dnorm y sus variantes, para conocer las diferentes opciones pueden utilizar 
?dnorm

#esta función requiere tres valores importantes, el conjunto X,  la media y la desviación estandar. 
#paso uno obtener media y desviación

#ejemplo, un experimento donde la muestra está entre -3 y 3, con un rango de 0.1, una media y desviacion similares

x = seq(-3, 3, by = .1)
x
media<- mean(x)
desviacion <- sd(x)

#obtenemos los valores de la densidad para cada punto en X 
valores <- dnorm(x, media, desviacion)
valores

#se plotea esta gráfica con plot utilizando tipo L (lineal)
plot(x, valores, type="l", main="Distribución normal", xlab="Valores X", ylab="Valores de densidad")
?dnorm
pnorm(0.3,0.25,.11)


