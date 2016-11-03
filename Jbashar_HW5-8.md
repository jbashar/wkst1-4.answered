# Worksheet 5: chapter 3#
1. ```matrix(1, 2, 5) ```

2. there are two possible ways	
	```a <- c(10, 14, 20, 30) 
	matrix(a, 2, 2) ```
	or 
	```dim(a) <- c(2,2) 
	print(a)``` 

3. Dim function sets dimensions to place your vectors 

4. One example of big data that can be converted into matrix is collection of  weather temperature patterns. Where there could be 12 columns for each month and 31/30 days or vice versa
5. 
	- contour map plot:contour(matrix)
	- 	3D perspective plot: persp(matrix)
	- 	heat map:image (matrix)
	
	The best matrix plot is the 3D perspective with limited expansion because it shows the best visualization for numbers on a 3D map. It clearly shows the dip representative of the change in elevation number which is harder to read in a 2D contour or heat map

# Worksheet 6: Chapter 4 #
1. 
	1) **Mean(vector)**: takes the average  of numeric values in vector

	2) **albine(h/v= mean(limbs))**: makes line representing the mean either as horizontal or verticle parameter

	3)**Barplot(vector)**: graph vector on x and y plane; x-axis shows the labels and y axis the values

	4) **deviation sd(vector)**: how much an individual value set differs the average value. Going one standard deviation up to the mean value gives the  top of normal range and opposite for bottom of normal range.

	5)**median(vector)** takes the middle value of the total data set 

2.  Vectors include:  
	limbs: vector
	names(limbs)
	pounds: vector
	meanValue: numeric 
	deviation: numeric
3. I think you can only create an abline line when the mean of the vector will equal 10. For example: 
	```limbs <- c(10,10)
	mean(limbs) == 10
	barplot(limbs) 
	abline(h=mean(limbs))```
for abline(v=...) = 10 the x-axis needs values that are dataset with mean value 10. In the given example we could state: 	
	```abline(v=mean(y))```

# Worksheet 7: Rstudio #
##Task 6  ##
#Creating vectors 
```x <- c(1,2,3,4,5,6,7,8,9,10)```

```y <- c(1, 4,9,16,25,36,49,64,81,100)```

#Creating scatterplots
```plot(x,y)```

#Creating barplot

windows() #keeps old graphs and doesn't overwrite
```barplot(x, width = 2, space=NULL)```

windows()
```barplot(y, width=2, space=NULL)```

#make them horizontal
windows() 
```barplot(x, width = 2, space=NULL, horiz = TRUE)```

windows()
```barplot(y, width=2, space=NULL, horiz = TRUE)```

#Create matrix
```w <- rbind(x,y)```

#Barplot of matrix
windows()
```barplot(w, width = 2, space = NULL)```

## Worksheet 8: chapter 5 ##
Task 1. Data set factors
	
- type of car involved in accidents
- type of plants 
- Grades: A,B,C,D,fail
- types of food at a party

Task 2.   
- plot: scatter plot values within the brackets  
- weights is the vector containing the values mapped on  the x-axis  
- prices is the vector containing the price values on y-axis  
-types: is vector containing values made into same factor category   
 pch=as.interger 
-converts the factor values in 'types' into integers to plot onto scatterplot