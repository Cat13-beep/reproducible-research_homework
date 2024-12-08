# Reproducible research: version control and R

Answers to 1-3 https://github.com/Cat13-beep/logistic_growth

**4a)** When the two random walks are executed it can be seen that they produce two differently shaped graphs, and every time the code is rerun the outcome is different as well (this highlights the random nature of the code) however limits the reproducibility of it as every new person running the code will be looking at slightly different graphs. The blue scale bar on the side of the diagram shows at what time the random walk is in different locations, with the dark blue being the oldest locations, and as it turns lighter blue it becomes more recent- this allows the journey of the random walk over time to be assessed). For example, in my plot  1, the movement started at (0,0) coordinate along the X and Y-axis and then moved downwards and to the left, before moving upwards and further to the left to end at location (-5,2). Contrastingly, plot two has a very different movement pattern- starting at (0,0.5) and going through different directions before ending up at (-3,-2.5). At every time interval, there are 500 different time intervals used in total, the movement will be 0.25 distance in a certain direction that is determined at a random angle. That is why there are many points and changes in direction in the diagrams, as almost every new movement will be in a new random direction.

**b)** The term random seed is a way to start a seemingly random process, so even though a random process is being displayed it can still be reproducible (1). For example, it can improve what was seen in the way that the outcomes of the code in question 4a were not reproducible as a different random walk is produced with each run of the code. The random seed will be set and therefore the code will start from the same place and lead to the same result each time that it is run. This works because the random process before is usually a pseudorandom process using a deterministic algorithm that depends on the starting value, so using the same starting value will produce the same sequence of events (2).

**c)** The code was rerun below the original two graphs labeling it as a new plot (plot3), however, this time it was seeded with a particular starting value (550 in my case), and then every time you rerun this code the same movement pathway is produced- therefore reproducible for whoever is running the code. The set.seed function was used. I committed it and now it is in my repo in the code for question 4 folder. 

**d)** In the commit history the latest commit showed differences between all the code I wrote because I repeated below the original code so as not to lose the first part of this question's code. Therefore, the specific addition I added cannot be located however it is the addition of the set.seed at the start of the code. I also changed the name of the plot and data (to 3) to distinguish them from plot/data 1 and 2 from the first part of the question. 

<p align="center">
<img src="https://github.com/Cat13-beep/reproducible-research_homework/blob/main/question-4-code/Question%204%20image.png" width="400" height="300">
</p>

**5a)** I imported the data set into posit from the repo file Cui_etal2014.csv, from the question 5 folder. I found From exploring the data that the table has 13 Columns and 33 Rows (excluding the headings). 

**5b)** V=aL^b is the allometric equation. To get to a linear model (Y=mx+c) I applied the log transformation to both sides of the equation and then applied the laws of logarithms to get logV= loga+blogL. I applied this transformation to both the genomic length of viral volume in posit when performing the regression analysis, code can be found in the folder in my repo.

**5c)** From the results of the linear regression, performed on the cleaned-up data and logged data. The logged linear model from the allometric equation shows that loga is going to be the intercept in the equation and in this case, it was 7.0748, therefore to get just alpha we need to get rid of the log by using the exponent (e)- this gives alpha as 1181.807 (3.s.f) and beta in the logged linear equation I displayed in 5b is the gradient which, from the output of the linear regression, is 1.5152, they are both statistically significant. The p-value for the alpha value is 2.28e^-10 and the beta value's P-value is 6.44e-10. Comparing this to what was in article (3) table two- for double-stranded DNA viruses (which is the kind of viruses in the dataset I used in my analyses) the Allometric exponent 95% CI is 1.16-1.87 with an average of 1.52, which is what I predicted beta value is when rounded to (2.d.p) Additionally, the predicted value for the Scaling factor from the table is 1,182 with a CI of (246 to 5,675), again when rounding my alpha value to this number of significant figures gives the same value as the paper. Therefore, both my predicted alpha and beta values match what was expected in the research paper that gave the data that I have been analyzing in this question. Despite my values matching what was in the table, the confidence interval is quite large, especially for the scaling factor, and therefore will likely depend on the individual double-stranded viral molecule being looked at.

**5d)** Code to produce the figure shown here as well as in a separate folder (in the question 5 data folder, called question 5 code). I used ggplot, with my cleaned virus data. I put the explanatory variable on the x-axis (the genome length) and the response variable on the y-axis (the virion volume), I also changed the axis names to match what was given in the figure that I am trying to copy and finally I added a line of best fit with the confidence intervals shown as a shaded region around the line. The code is also here- ggplot(Virus_clean, aes(x = log(genome_length_kb), y = log(virion_volume_nm_nm_nm))) + geom_point() + xlab("log[Genome length (kb)]") + ylab("log[Virion volume (nm³)]") + theme_minimal() + geom_smooth(method=lm, se=TRUE). Using this code produced an image that looked exactly like the one in the question.
 
**5e)** I can use the predicted values of alpha and beta from my answer to 5c to predict the volume of a virion with a genomic size of 300kb for a double-stranded DNA virus. As discussed above my values are the same as that of the double-stranded DNA values in the table so I can be confident in my estimated answer with my values for alpha and beta- input into the equation V=aL^b (L is bp so need to change 300kb to 300,000 nucleotides) which is 1181.807 * 300,000^1.5152= a viral volume of 2.35*10^11 nm^3.

**References:**
1) https://stackoverflow.com/questions/22639587/what-does-random-seed-do-in-python
2) https://www.baeldung.com/java-random-seed
3) Cui, Schlub, and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14)

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
