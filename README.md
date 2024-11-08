# Reproducible research: version control and R

Answers to 1-3 https://github.com/Cat13-beep/logistic_growth

4a) When the two random walks are executed it can be seen that they produce two differently shaped graphs, and every time the code is rerun the outcome is different as well (this highlights the random nature of the code). The blue scale bar on the edge of the diagram shows at what time the random walk is in different locations, with the dark blue being the oldest locations, and as it turns lighter blue it becomes more recent- this allows the journey of the random walk over time to be assessed). At every time interval, the code puts in 500 total, the movement will move 0.25 in a certain direction that is determined to be at a random angle by the code. That is why there are many points and changes in direction in the diagrams, as every new movement will be in a new random direction.

b) The term random seed is a way to start a seemingly random process, so even though a random process is being displayed it can still be reproducible, in the way the outcomes to the code in question 4a were not reproducible as a different random walk is produced with each run of the code. The random seed will be set and therefore the code will start from the same place and lead to the same result each time that it is run.

c) The code was rerun below the original two graphs with a new plot (plot3), however, this time it was seeded with a particular starting value (550 in my case), and then every time you rerun this code the same movement pathway is produced- therefore reproducible for whoever is running the code. The set. seed function was used.

d) 
<p align="center">
<img src="https://github.com/Cat13-beep/reproducible-research_homework/blob/main/question-4-code/Question%204%20image.png" width="500" height="400">
</p>

5a) Imported the data set into posit- the table has 13 Columns and 33 Rows (excluding the headings)

5b) V=aL^b is the allometric equation, to get to a linear model (Y=mx+c) I applied the log transformation to both sides of the equation and then applied the laws of logarithms to get logV= loga+blogL. I applied this transformation to both the genomic length of viral volume in posit when performing the regression analysis.

5c) From the results of the linear regression, performed on the cleaned-up data and logged data. The logged linear model from the allometric equation shows that loga is going to be the intercept in the equation and in this case, it was 7.0748, therefore to get just alpha we need to get rid of the log by using the exponent (e)- this gives alpha as 1181.807 (3.s.f) and beta in the logged linear equation I displayed in 5b is the gradient which, from the output of the linear regression, is 1.5152, they are both statistically significant. The p-value for the alpha value is 2.28e^-10 and the beta value is 6.44e-10. Comparing this to what was in the article's table two that this question is based on- it has a range of values (95% confidence interval) for possible allometric exponent values- 1.26-1.6 (with a mean of 1.43). The confidence interval for predicted values of the scaling factor is 1185-3571 with an average of 2057. So the values that I calculated are close to these ranges, the predicted beta value is within the range and the alpha value I calculated is slightly lower.
My values are, however, identical to the number of significant figures the table holds for double-stranded DNA viruses, What are the types of viruses present in the table?

5d) Code to produce the figure shown here as well as in a separate folder (in the question 5 data folder, called question 5 code). I used ggplot, with my cleaned virus data. I put the explanatory variable on the x-axis (the genome length) and the response variable on the y-axis (the virion volume), I also changed the axis names to match what was given in the figure that I am trying to copy and finally I added a line of best fit with the confidence intervals shown as a shaded region around the line. The code is also here- library(ggplot2). ggplot(Virus_clean, 
 aes(x = log(genome_length_kb), y = log(virion_volume_nm_nm_nm))) + geom_point() + xlab("log[Genome length (kb)]") + ylab("log[Virion volume (nm³)]") + theme_minimal() +
 geom_smooth(method=lm, se=TRUE).Using this code produced an image that looked like the one in the question.
 
5e) I can use the predicted values of alpha and beta from my answer to 5c to predict the volume of a virion with a genomic size of 300kb, my results however were for all the viruses and this one specifically is a double-stranded DNA virus, (as the research article demonstrates there are slight differences between different types of virus. Despite this, as discussed above my values are the same as that of the double-stranded DNA values in the table so I can be confident in my estimate with my values can be calculated using the equation V=aL^b which is 1181.807 * 300^1.5152= a volume of 6.697*10^6 nm^3.


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
