#Ejercicio 1
#prueba de hipotesis para valores mayores
#1 h0: MU >= 20000 
#2 h1:  Mu < 20000 

#3- Alfa
alfa <- 0.03

n=100
media= 19500
sd= 3900
mu=20000

#4- estadistico
z0<- (media-mu)/(sd/sqrt(n))
z0


#5- valor de la normal al ser mas de 30 elementos en la muestra con alfa = 5%
zAlfa <- qt((alfa),(n-1))
zAlfa



#6 analizando el criterio de rechazo. 
z0 <  zAlfa
#-1.28<-1.90259 (ES FALSO)
#se acepta la hipotesis nula, donde se define la media como mayor o igual a 20000
#no hay suficiente evidencia estadística para inferir que la hipótesis nula es falsa



#Ejercicio 1
#hipotesis de varianza. 
#definimos la hipótesis. 
##1. h0: sigma <= 40
#2  h1: sigma > 40 

#3 y 4 se definen las siguientes variables. 
n= 10
s2 <- 27  #(varianza de la muestra)
sigma20<- 40  #(varianza de la población)
alfa <- 0.05

#5 calculamos el estadistico de pruebas
X2 <- ((n-1)*s2)/sigma20
X2

#6 se calcula chi cuadrada para alfa (ojo, alfa, no alfa/ 2, ya que se está validando una cola)
chi_sd2<- qchisq(1-alfa, n-1)
chi_sd2

#7 verificación
X2> chi_sd2
# 6.075 > 16.9188 (FALSO)
#se acepta la hipotesis nula que indica que el valor de sigma es menor o igual a 40
#no hay suficiente evidencia estadística para inferir que la hipótesis nula es falsa


#EJERCICIO 3
#Variables

media <- 35
n <-30
desv <- 3.5
alfa <- 0.05/2
nivelconfianza <- 1- alfa

normal<- qnorm(nivelconfianza,0,1)
normal
#o
normal<- qnorm(alfa,0,1)
normal

error<-  desv/sqrt(n)
error
margen <- abs(normal)*error
margen

limInf<- media - margen
limsup <- media +margen
limInf
limsup
#el intervalo de confianza es 35 +/- 1.252436 (33.74-36.25)


#EJERCICIO 4
#Variables

media <- 500
n <-5000
desv <- 100
alfa <- 0.10/2
nivelconfianza <- 1- alfa

normal<- qnorm(nivelconfianza,0,1)
normal
#o
normal<- qnorm(alfa,0,1)
normal

error<-  desv/sqrt(n)
error
margen <- abs(normal)*error
margen

limInf<- media - margen
limsup <- media +margen
limInf
limsup
#el intervalo de confianza es 500 +/- 2.32 (497.67-502.3262)



#EJERCICIO 5
#1 Variables del conjunto Tree $Girth y $height

#Regresión lineal
lm.trees <- lm(Height~Girth, data=trees)
summary (lm.trees)

#2 la formula generada es height= 62.03 + 1.05girth
#3 el intercepto es 62.03, el R2 es 0.26 y el R2 ajustado es 0.24 

#4 Regresión lineal entre girth y volumen
lm.trees2 <- lm(Volume~Girth, data=trees)
summary (lm.trees2)

#5 la formula generada es  volumen= -36.94 + 5.06 Girth
#6 intercepto = -36.94, R2= 0.9353 y R2ajustado = 0.9331

#7 basados en su grado de correlación -R2- la relación entre Girth y Volumen es mejor 
#que la de Girth y height


