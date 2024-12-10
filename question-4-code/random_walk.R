#installing the correct packages
#install.packages("ggplot2")
#install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

#creating the random movement function

random_walk  <- function (n_steps) {
  
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  
  df[1,] <- c(0,0,1)
  
  for (i in 2:n_steps) {
    
    h <- 0.25
    
    angle <- runif(1, min = 0, max = 2*pi)
    
    df[i,1] <- df[i-1,1] + cos(angle)*h
    
    df[i,2] <- df[i-1,2] + sin(angle)*h
    
    df[i,3] <- i
    
  }
  
  return(df)
  
}

#running the random movement function with 500 time points

data1 <- random_walk(500)

plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

#Running the script again with 500 time points (can compare these two graphs)

data2 <- random_walk(500)

plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

#Displaying these two graphs side by side

grid.arrange(plot1, plot2, ncol=2)

#the two random walks are different from one another, over time they move in a random way and you can see their movements over time. 

#every time you run the code the outcome is slightly different



#Edit of the code to make this production of a random movement process (like Brownian movements) reproducible
#setting the seed at 250 but this is just an example (it can be any number)

random_walk2  <- function (n_steps) {
  
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  
  df[1,] <- c(0,0,1)
  
  for (i in 2:n_steps) {
    
    h <- 0.01
    
    angle <- runif(1, min = 0, max = 2*pi)
    
    df[i,1] <- df[i-1,1] + cos(angle)*h
    
    df[i,2] <- df[i-1,2] + sin(angle)*h
    
    df[i,3] <- i
    
  }
  
  return(df)
  
}



data3 <- random_walk2(1550)

plot3 <- ggplot(aes(x = x, y = y), data = data3) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")


(plot3)

#now every time you run this code it will create the same diagram (movement pathway) as it is being seeded by the same starting value

#saving the packages used for this analysis

sink(file = "package-versions.txt")
sessionInfo()
sink()

