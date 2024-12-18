## Reproducible Research: Version Control and R Practical Answers

**Question 1-3)** Answers to questions 1-3 https://github.com/Cat13-beep/logistic_growth

# Question 4
**Modelling Reproducible Random Processes**

**4a)**
**Observations Regarding Code That Produces Two Random Walks**

When the two random walk codes are executed it can be seen that they produce two differently shaped graphs, and every time the code is rerun the outcome is different as well (this highlights the random nature of the code), this limits its reproducibility as every new person running the code will be looking at slightly different graphs. The blue scale bar on the side of the diagram shows at what time the random walk is in different locations, with the dark blue being the oldest locations. As it turns lighter blue it becomes more recent- this allows the journey of the random walk over time to be assessed. For example, in my plot 1 (the first time I ran the code), the movement started at (0,0) coordinate along the X and Y-axis and then moved left and up a bit, before moving roughly in the direction (1,-2), it then moved upwards again towards the starting (0,0) location, then it moved upwards and towards the right (2,1.5) before moving down and right to end up at (2.5, -1.5). Contrastingly, my plot two has a very different movement pattern- again it started at (0,0) which is what all the graphs will start at as the starting value is within the code, the random walk then goes through multiple different directions of movement before ending up at (0,-4). These two random walks and their comparison can be seen in my repo in the file randomwalkplot.png.  At every time interval for movement, there are 500 different time intervals where a step is taken each time, the movement will be 0.25 distance in a certain direction (0.25 is multiplied by a sin/cos angle to determine movement direction) that is determined at a random angle. That is why there are many points and changes in direction in the diagrams (the plots look very angular and follow zig-zag movements) as almost every new movement will be in a new random direction.

**4b)**
**What is a Random Seed? Improving Reproducibility**

The random seed is a set value; therefore, the code for movement will start from the same place and lead to the same result each time it is run. This works because random processes in code are usually pseudorandom processes using a deterministic algorithm that depends on a specific starting input, so using the same starting value will produce the same sequence of events and outcome graph shape (1). For the two different random walk graphs discussed in 4a, this was likely due to different starting inputs being used by the code resulting in two different sequences of events. Random seeds are used as a way to start a seemingly random process so that is still reproducible (2). For example, it can improve the problem that was seen in the way that the outcomes of the code in question 4a were not reproducible as a different random walk is produced with each run of the code.

**4c)**
**Reproducible Code to Simulate Brownian Motion**

Brownian motion is the random movement of gas and liquid particles (3). It is often modeled with the code for the random walk-in statistics, to show the random movements of the particles in space. The Wiener process which is used to simulate Brownian motion in mathematics has some differences to the random-walk output, however. For example, random-walk code has movement in certain discrete time intervals however brownian motion is usually modeled using the Weiner process which has continuous motion that causes scale invariance (the diagram does not change shape if the scale is changed). The key features of the Brownian movement by Weiner equation are w0 (starts at 0) which the random-walk code did, Wt should be continuous however the random walk code used in the previous part of the question is discrete, Wt should be independent which the random walk code is as the movement at a certain time is not dependent on what has occurred in the past, finally the increment of the movement between points should be drawn from a specific normal distribution (not done in the random-walk) (3). Random walk converges to the Wiener process through the use of very small steps (4).

Therefore I tried to improve reproducibility and similarity to Brownian movements. To improve the reproducibility of the code I added repeated code below the original two graphs to produce a third graph labeling it as a new plot (plot 3). This time it was seeded with a particular starting value (250 in my case), and then every time you rerun this code the same movement pathway is produced- therefore reproducible as whoever is running the code will see the same graph. The set.seed() function was used to do this putting my seeded value within the bracket. In addition to changing reproducibility, I tried to make it more like the Wiener process which is continuous, by making the graph smoother by increasing the number of steps. There are other key points of the Wiener process however that could have also been incorporated to make it more realistic, for example, movement increments being drawn from a normal distribution (3). I committed my changes to the code and now it is in my repo in the question-4-code folder Random_walk.R.

**4d)**
**Adding the Commit Comparison to README.md**

In the commit history, the latest commit shows the introduction of the set-seed function (the change is highlighted in this view through highlighting with green) to make the output of the random motion more reproducible. I have also performed changes to the number of steps, increasing this, to try to get a smoother graph that resembles the continuous movement of Brownian motion better than the previous random-movement code. It is not completely continuous however, this and taking the movement directions from a certain normal distribution could have made it even more like Brownian motion. The commitment to make the graph more like the Brownian movement was done at a separate time to adding the set-seed so this comparison just shows my introduction of the code to make the graph more reproducible.

<p align="center">
<img src="https://github.com/Cat13-beep/reproducible-research_homework/blob/main/question-4-code/q4image.jpg" width="650" height="400">
</p>

# Question 5
**Exploring the Relationship Between Viral Volume and Genome Length**

**5a)**
**Adding Data into R and Exploring Data**

I imported the data set into posit from the repo file Cui_etal2014.csv, from the question 5 folder. I found the number of rows and columns by exploring the data using nrow and ncol functions. I discovered that the table has 13 Columns and 33 Rows. 

**5b)**
**Transforming Data to Make Linear**

V=aL^b is the allometric equation. To get to a linear model (Y=mx+c) I applied the log transformation to both sides of the equation and then applied the laws of logarithms to get logV= loga+blogL. I applied this transformation to both the genomic length of viral volume in posit when performing the regression analysis, code can be found in the question-5-data folder in my repo in Question5codeR (all my code for question 5 is here).

**5c)**
**Exploring Linear Model to get Constant Values for the Allometric Equation**

From the results of the linear regression, performed on the cleaned-up and logged data I estimated the alpha and beta values to put into the allometric equation. The logged linear model from the allometric equation shows that loga is going to be the intercept in the equation and in this case, it was 7.0748, therefore to get just alpha we need to get rid of the log by using the exponent (e)- this gives alpha as 1181.807 (3.s.f). The beta value in the logged linear equation I displayed in 5b is the gradient which, from the output of the linear regression, is 1.5152, both values are statistically significant (p<0.05). The p-value for the alpha value is 2.28e^-10 and the beta value's P-value is 6.44e-10. As the values are statistically significant it shows there is a significant positive linear correlation between genome length and viral volume, as well as this the R-squared value is high (0.7), and therefore alot of the variation of viral volume can be explained by variation in the genome length of the viruses (70%). 

Comparing my alpha and beta values to what was in the article's (5) table two- for double-stranded DNA viruses (which is the kind of viruses in the dataset I used in my analyses) the allometric exponent (beta value in the allometric equation) 95% CI is 1.16-1.87 with an average of 1.52, which is what I predicted the beta value to be when rounded to (2.d.p). Additionally, the predicted value for the scaling factor, related to the alpha value from the allometric equation, from the table is 1,182 with a CI of (246 to 5,675), again when rounding my alpha value to a certain number of significant figures it gives the same value as the paper. Therefore, both my predicted alpha and beta values match what was expected in the research paper that gave the data that I have been analyzing in this question. Despite my values matching what was in the table, the confidence interval is quite large, especially for the scaling factor, and therefore will likely depend on the individual double-stranded viral molecule being looked at. **Alpha value- 1181.807 Beta value- 1.52**

**5d)** 
**Production of Graph Comparing Genome Size and Viral Volume**

Code to produce the figure shown here as well as in a separate folder (in the question 5 data folder, called question 5 code). I used ggplot, with my cleaned virus data. I put the explanatory variable on the x-axis (the logged genome length) and the response variable on the y-axis (the logged virion volume), I also changed the axis names to match what was given in the figure that I am trying to copy and finally I added a line of best fit with the confidence intervals shown as a shaded region around the line.

The code is also here: 

ggplot(Virus_clean,

aes(x = log(genome_length_kb), y = log(virion_volume_nm_nm_nm))) + geom_point() +

xlab("log[Genome length (kb)]") + ylab("log[Virion volume (nm³)]") + 

theme_minimal() + 

geom_smooth(method=lm, se=TRUE).

<ins>Using this code produced an image that looked like the one in the question.</ins>
 
**5e)**
**Using the Allometric Equation to Estimate Viral Volume From Genome Length**

I can use the predicted values of alpha and beta from my answer to 5c to predict the volume of a virion with a genomic size of 300kb for a double-stranded DNA virus. As discussed above my values are the same as that of the double-stranded DNA values in the paper's table so I can be confident in my estimated answers for values for alpha and beta. Inputting these into the equation V=aL^b as well as genome predictor length (in the question it states L is nucleotides which suggests having to multiply 300 by 1000 however in the dataset and graph kb are used so that is what I will put into my equation here). The equation with the substituted values is 1181.807 x 300^1.5152= giving a predicted viral volume of **6.697x10^6 nm^3**. I mentioned the confidence interval for the alpha and beta variables was quite large so it might mean predictions are not completely accurate. 

**References:**

1)  https://www.baeldung.com/java-random-seed
2)  https://www.statology.org/set-seed-in-r/
3) "Brownian Motion." Wikipedia, Wikimedia Foundation, 30 Nov. 2024, en.wikipedia.org/wiki/Brownian_motion. Accessed 10 Dec. 2024.
4) "Random Walk." Wikipedia, Wikimedia Foundation, 25 Nov. 2024, en.wikipedia.org/wiki/Random_walk. Accessed 12 Dec. 2024.
5) Cui, Schlub, and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14)
6) Wickham, Hadley, Mine Çetinkaya-Rundel, and Garrett Grolemund. R for data science. " O'Reilly Media, Inc.", 2023.
7) I used coding files from previous labs (for example when cleaning the data I used cleaning code pipelines learned in reproducible figures practical)

## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points. First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   a) A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points) \
   b) Investigate the term **random seeds**. What is a random seed and how does it work? (5 points) \
   c) Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points) \
   d) Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points) 

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \alpha L^{\beta}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   a) Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)\
   b) What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points) \
   c) Find the exponent ($\beta$) and scaling factor ($\alpha$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points) \
   d) Write the code to reproduce the figure shown below. (10 points) 

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  e) What is the estimated volume of a 300 kb dsDNA virus? (4 points) 
