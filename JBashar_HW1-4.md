# Worksheet 2:  #
1. **What is the R user's name?** 
	James Curley 
 
2. **What topic do they work on**?
	Neurobiology of Social behavior with most recent paper studying social structure hierarchy of lab mice and the association of dominant status with specific gene expression in the brain.    

3. **Which answer did you find most surprising / what did you learn from reading their story?**  
	James was very descriptive in the ways you can use R and the aspects that are helpful. I like how he highlighted the ability to reproduce analysis with R and and visualize data. I am excited to see this myself.

###Story #2:###
1. **What is the R user's name?**: 
	Paola Cognigni 

2. **What topic do they work on?**: 	
	Neuroscience of Drosophila behavior  

3. **Which answer did you find most surprising / what did you learn from reading their story?**
	 I have to look into what ggplot is, as he recommends starting it right away. 

###Story #3:
1. What is the R user's name?
	   Abby Heithoff

2. W**hat topic do they work on?**
	Neurobiology of HIV and AIDS in populations 

3. W**hich answer did you find most surprising / what did you learn from reading their story?**
	I am going to look at the resource they recommended and do my best to do play around with R and document my attempts. 


### Story #4: ###
1. **What is the R user's name?**
	Carina Gsottbauer

2. W**hat topic do they work on?**
	Climate change on physiology of Harvested Shellfish

3. W**hich answer did you find most surprising / what did you learn from reading their story?**
	Again, Carina's interview provided resources that could help my R training and I will look into tutorials by Bodo Winter

# Task 2: summarize #
After reading several stories about people who use R, is there anything problem that you think R can help you to solve? Is there anything particular that caught your interest?

	I think the R language is very flexible and I am very excited to brainstorm ideas on how to apply it to research. I particular want to visualize my data.

Is there anything that didn’t make sense to you or was unexpected?

	There is a lot I am trying to learn such as syntax

# Worksheet 3: Chapter 1 #
1. Differencs from perl 

	- The use of "==" to define equal 
	- Being able to use T/F shorthands for true and false respectively  
	- In perl you store values like $_= value but in R you store values using arrow to direct where value is to be stored 
	-  you do not need to perl in command line to show variable contents
	

2.  
	Multiply: 7*8
	Divide : 7/8 
3. 
	A. 3 < 4: Yes
	B. 3 == 4: Yes
	C. x <- 4: No
	D. 4 -> x: No
4. 
	Yes:y <- FALSE
5. 

	- Sum( ): adds up numbers within bracket
	- rep( ): repeats value within bracket
	- list.files(): calls list files saved similar to ls in perl  
	- sqrt(#): returns the square root of number value in bracket 

6. ```list.files() ```
7. ```source("file.R")```
8. No

# Worksheet 4: Chapter 2 #
1. 
	Boolean:is a type of programming logic used to describe the relationship between different data sets. The Boolean data types include AND, OR, <, > etc. Adding the boolean will generate true or false statement after comparing the relationship between the data sets. 

	Numeric: value that is numeric and is considered a number that can be evaluated

	String: usually word sets or non-numeric values; constant 

2. ```vector <- c(1, TRUE, "Hello")```
	combining different data structures into a vector changes them to the same data type for example all become string type
3. ```seq(1,2,0.1)```
	This command prints sequence between 1 to 2 in increments of 0.1. 
4. ```vector <- c(apple, orange, pear)```
5.
	these elements are indexed and can be called vector[1] returns "apple"
5. 
	[1] "I"        "am"     "learning"
	[4] "R" 
	 R starts counting at 1 index while perl starts at 0
6. 2 plots
	barplot: barplot(vector); 
	x values are the assigned labels of values and y values are the count
	Scatterplot: plot(x,y); x and y are variables that have values stored in them and are respectively used for horizontal axis and verticle axis 
