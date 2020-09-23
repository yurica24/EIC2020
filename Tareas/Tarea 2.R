#Tarea 2

#*************Ejercicio 1
#Distribución Binomial

#1. variables a utilizar


n<- 16
p<- 0.4
q<- 0.6
x <- 1:n

#2. Grafica de distribución binomial 

?dbinom
prob=dbinom(x,n,p)
barplot(prob, main = "Distribucion binomial Meningitis por salmonelas", names.arg =x)

#si lo queremos con líneas
plot (x, prob, type="l",  main = "Distribucion binomial Meningitis por salmonelas")


#3.	Probabilidad de que sobrevivan todos los pacientes (n=16)

#utilizamos dbinom para obtener la probabilidad en un punto específico 

prob2 <- dbinom(16,n,p)
prob2
#La probabilidad que todos los pacientes sobrevivan es de 4.294967e-07


#4.Probabilidad de que sobrevivan más de la mitad de los pacientes (P[X>0) = 1-P[X<=8])

#utilizamos la función Pnom con q=8 para calcular la probabilidad de 0 a 8 
prob3 <- pbinom(8, n, p)

#para obtener la prob de X>8, restamos 1-prob3
prob4 <- 1-prob3
prob4
#La probabilidad que sobrevivan más de 8 pacientes es de 0.1422697




#Ejercicio 2
#distribución  normal 

#1. Variables
m<- 0.25
ds<- 0.11
x1 <-seq(0, 1, by = .01)

#2. Grafica
probnormal <- dnorm(x1, m, ds)
plot(x1, probnormal, type="l", main="Distribución normal", xlab="Valores X", ylab="Valores de densidad")

#3.	Una concentración superior o igual a 0.6 partes por millón (x>=0.6) se considera extremadamente alta ¿Cuál es la probabilidad de que un individuo seleccionado al azar esté incluido en esa categoría? 

#x =>0.6 

prob1 <- pnorm(0.6,m,ds)
prob2 <- 1-prob1
prob2

# La probabilidad que un individuo seleccionado al azar esté en el área mayor a 0.6 es de 0.0007317683


#4.Obtener la probabilidad de que la concentración en plomo, en partes por millón, de un individuo sea inferior a 0.15 (x<=0.15)

#x<= 0.15
prob3 <- pnorm(0.15, m, ds)
prob3
#la probabilidad que la concentración de plomo de un individuo sea inferior a 0.15 es de 0.1816511


#5.	Determinar la concentración mínima del 30% de los individuos con más concentración (p=0.30)
#utilizamos  qnorm para calcular P[X<x]= 0.30, el valor de x en el cuantil 30

prob4 <- qnorm(0.3,m,ds)
prob4

#la concentración minima del 30% de individuos es de [1] 0.1923159



#Ejercicio 3
#distribución de poisson

#1.	Identificar las variables para el experimento (λ) y el vector inicial (0:5) 
lb<- 5
x <- 0:5

#2.	No se produzcan más de cuatro capturas en un día
#X <=4
?dpois
prob1 <- ppois(4, lb)
prob1

#R/ la probabilidad que no se produzcan más de cuatro capturas al día es 0.4404933

#3.	Se produzcan al menos cuatro capturas en un día
#x => 4

prob2 <- ppois(3,lb)
prob3 <- 1-prob2
prob3

#la probabilidad que se produzca al menos 4 capturas al día es de 0.7349741

#4.	Se produzcan menos de cuatro capturas en un día
# xz < 4
prob4 <- ppois (3, lb)
prob4
#la probabilidad que se produzca menos de 3 capturas al día es de 0.2650259

