#---
#title: "ACTG306_Tutorial_A.R"
#author: "Daniel Fulop"
#date: "October, 2016"
#history: modified from "Pleuni Pennings" and DataJoy
#student's information:
#name:
#date:
#---

###########################################################
#INTRO TO TUTORIAL ACTG306 A (partly merged 1 & 2 from last year)
###########################################################

#In this tutorial, we are going to look at the HIV sequences from 
#patients in clinical trial ACTG306 
#ACTG stands for Aids Clinical Trials Group. 
#The data from the trial were described in this paper:  

#<http://hivdb.stanford.edu/pages/pdf/kuritzkes_15097303.pdf>
#J Acquir Immune Defic Syndr. 2004 May 1;36(1):600-3.
#Rate of thymidine analogue resistance mutation accumulation with zidovudine- or stavudine-based regimens.
#Kuritzkes DR, Bassett RL, Hazelwood JD, Barrett H, Rhodes RA, Young RK, Johnson VA; Adult ACTG Protocol 306 370 Teams.

###########################################################
#CODE FROM TUTORIAL
###########################################################

#Let's load our sequences and start taking a look at them
############ CODE
#load the library seqinr
library(seqinr)
#read the fasta file
read.fasta("ACTG306_RT_fasta.txt")->SeqData
#This piece of code is to get more meaningful names for the sequences - instead of just "PtID." Don't worry if it doesn't make much sense. You can execute the entire chunk of code by using the little "chunks" menu on the upper right of this window or by clicking option-command-C. 
annotations<-c();seqnames<-c()
for (i in 1:length(SeqData)){
  annot = attr(SeqData[[i]],"Annot")
  annotations<-c(annotations, annot)
  patlocstart = regexpr("pat",annot)[1]+3
  patlocend = regexpr("\\|",substr(annot,patlocstart,patlocstart+10))[1]+patlocstart
  pat = substr(annot,patlocstart,patlocend-3)
  weekstart = regexpr("Week",annot)[1]+5
  week = substr(annot,weekstart,weekstart+10)
  attr(SeqData[[i]],"name")<-paste("pat_",pat,"_week_",week,sep="")
  seqnames<-c(seqnames,attr(SeqData[[i]],"name"))
  }
  
#This piece of code is to give you an overview of the data we have organized by patient (pat) & week: 
for (i in 1:30){
    print(attr(SeqData[[i]],"name"))
    }
#For which weeks do we have data for patient 29?


#The sequences are all from the reverse transcriptase gene of HIV. 
#We are going to look at a single sequence and use the function "table" 
#to determine which letters are most common in the sequence. 

############ CODE
#Look at the first sequence 
SeqData[[1]]
#Use "table" to determine the frequency of all the nucleotides. 
table(SeqData[[1]])

############ TASK 1
#As you can see, there are other letters than just CTG and A. 
#Google "ambiguity codes DNA". 
#Write down the letters from the first sequence and what they mean. 
#In this case, the "." probably means that the base was not sequenced. 

############ CODE
#In R, we often run multiple functions on one object at the same time. 
#For example, I'd like to taburalize SeqData[[1]] and then sort the resulting table. 
#I could do this in the following way: 
sort(table(SeqData[[1]]))

#To find out more about a function, type ?function 
?sort

############ TASK 2
#Which nucleotide is most common in the sequence?

#The package "seqinr" comes with a handy function called "translate". 
#It translates a DNA sequence into amino acids. 

############ CODE
translate(SeqData[[1]])

############ TASK 3
#Why does the translation start with a bunch of X's? 
#How many amino acids are in the sequence? 

############ CODE
# You can use the function length() to ask R how many amino acids are in the sequence 
length(translate(SeqData[[1]]))

#Next, we're going compare two amino acid sequences. 
#First, let's save the amino acid sequence of patient 7, week 0 into a variable called AA_Pat7_week0. 
#Next, let's save the amino acid sequence of patient 7, week 41 into a variable called AA_Pat7_week41.

############ CODE
AA_Pat7_week0<-translate(SeqData[[3]])
AA_Pat7_week41<-translate(SeqData[[5]])

#Look at the amino acid sequences, by simply typing the name of the variable and running that line of code. 
AA_Pat7_week0

#You could also write 
print(AA_Pat7_week0)

############ TASK 4 
#How many amino acids changed for the virus of patient 7 between day 0 and day 41?
#Which amino acids?
#We use the which() function here and also the != (is not equal) operator
which(AA_Pat7_week0!=AA_Pat7_week41)

#If you are too lazy to count (and lazy is a good thing in this case!), you can use length() again, 
# to determine how many differences there are. 

############ TASK 5: Looking at patient 18. 
#Sequences 15 and 16 come from patient 18. 
#Find out from which weeks they are. 
#Save the amino acid sequences into variables with appropriate names (like we did for patient 7 before)
#Determine which amino acids have changed between the two time points. 

#We now now which amino acids changed in the RT gene of the HIV virus of patient 7 between week 0 (when they started treatment) and week 41. 
#Some of these amino acids may be important for drug resistance. 

#With the other files you downloaded (and uploaded to DataJoy), there is also a simple text file 
# with the most important drug resistance mutations for NRTI drugs. 
#All the drugs in the 306 trial are NRTI drugs. 

ListDRMs <- read.table("DRM_file_WHO_NRTI.txt", header = T, stringsAsFactors = F)

#ListDRMs is a dataframe
#If you want to look at the first row of the dataframe, type 
ListDRMs[1,]
#If you want to look at the first column of the dataframe, type 
ListDRMs[,1]
#If you want to look at the 3rd row of the 6th column, you type
ListDRMs[3,6]
#If you want to know the names of the columns, type
names(ListDRMs)
#If you know the name of the column you're interested in, but not the number, you type
ListDRMs$AminoAcid
#And for the 5th row of the column with that name, you type 
ListDRMs$AminoAcid[5]

############ TASK 6
#How many amino acids are listed in ListDRMs?
#What code would you write to output the 3rd row of the column with name "Resistant"?
#For position 67, which amino acid is listed as the normal amino acid (wild type) and which is/are listed as resistant?
#Which of the amino acids that changed between week 0 and week 41 in patient 7 are important for resistance?

#Let's try to do the last question using the R function called grepl() and another function called match() 

#grepl(pattern,string) asks whether a pattern is found in a string
#match(element, list, nomatch = 0)>0 asks whether an element is found in a list

#Link to information about grepl fundtion <http://www.endmemo.com/program/R/grepl.php>
grepl("g", "dog") 
grepl("g", "cat") 

MyListAnimals<-c("dog","cat","monkey","bird")
MyListFruit<-c("strawberry","lemon","apple", "banana")

#is dog found in the first or second list?
match("dog", MyListAnimals,nomatch = 0)>0
match("dog", MyListFruit,nomatch = 0)>0

#an easier way to find whether an element is found in a list, is to do 
"dog" %in% MyListAnimals

############ TASK 7
#Write two different lines of code to ask whether apple is part of the list of animals or the list of fruits.

#OK, now we'll use grepl and %in% on the sequences from patient 7 and the list of resistance mutations. 
#For each of the differences between the week 0 sequence and the week 41 sequence for patient 7, let's check if it leads to resistance

ListOfDifferences<-which(AA_Pat7_week0!=AA_Pat7_week41)
ListOfDifferences 

#Let's look at the first amino acid that is different between week 0 and week 41: 
AminoAcidPosition<-91
#if not in the list, print "not in list"
  if (!(AminoAcidPosition %in% ListDRMs$AminoAcid)){
    print(c("Amino acid",AminoAcidPosition,"not in ListDRMs"))
  }
#if the amino acid position is in the ListDRM list, check whether resistant
 if(AminoAcidPosition %in% ListDRMs$AminoAcid){
    #check whether the new amino acid in the sequence is listed as a resistant one    
    #First let's get the amino acid from the patient's sequence
    newAminoAcid<-AA_Pat7_week41[AminoAcidPosition]
    #Now let's determine which row in the ListDRMs dataframe we should be comparing with
    rowListDRMs<-which(ListDRMs$AminoAcid==AminoAcidPosition)
    #Now let's look at the resistant amino acids listed in that row in the column "Resistant"
    ResistantAminoAcids<-ListDRMs$Resistant[rowListDRMs]
    #now we use grepl to determine whether the pattern newAminoAcid is found in the string ResistantAminoAcids
    resTrueFalse<-grepl(newAminoAcid, ResistantAminoAcids)
    print(c("Amino acid",AminoAcidPosition,"resistant?",resTrueFalse))
    }
    
############ TASK 8 
#Replace the "91" in the code we provided above and look at all of the amino acids in the ListOfDifferences. 
#Is any of the amino acids relevant for drug resistance? 
    

#We can do the same task using a loop, that way we don't have to type the numbers of the amino acids one by one.     
for (i in ListOfDifferences){
  #if not in the list, print "not in list"
  if (!(i %in% ListDRMs$AminoAcid)){
    print(c("Amino acid",i,"not in ListDRMs"))
  }
  #if the amino acid position is in the ListDRM list, check whether resistant
  if(i %in% ListDRMs$AminoAcid){
    #check whether the new amino acid in the sequence is listed as a resistant one    
    newAminoAcid<-AA_Pat7_week41[i]
    resTrueFalse<-grepl(newAminoAcid,ListDRMs$Resistant[which(ListDRMs$AminoAcid==i)])
    print(c("Amino acid",i,"resistant?",resTrueFalse))
    }
  }
  
############ TASK 9   
#Now it is your task to write the code to do the same analysis for patient 18, week 70. 
#Remember that you have already saved the amino acid sequence from this patient's week 70 sample in a variable. 



#OK, lets now look at all sequences and determine whether they have resistance amino acids. 
# First we make a dataframe
#make empty dataframe (just with the sequence names)
PatData<-data.frame(name=seqnames)

# ... and add with the DRM (DRM = drug resistance mutation) states in each patient
#now the next piece of code (until } around 20 lines down) is repeated for every one of the 15 DRMs in the DRM list
for (DRMnum in 1:length(ListDRMs[,1])){

  #make new column for the next aa position, fill it with "TRUE"s
  PatData[,length(names(PatData))+1]<-TRUE
  #change the name of the new column so that it reflects the position of the DRM
  names(PatData)[length(names(PatData))]<-ListDRMs$AminoAcid[DRMnum]
  
  #for each sequence determine whether resistant or not at that position
  # the next piece of code is repeated for each sequence
  for (SeqNum in 1:length(PatData[,1])){

    #get the amino acid for sequence SeqNum 
    AAseq <-translate(SeqData[[SeqNum]])
    #and only keep the amino acids at position DRMnum
    AAatDRMPos<-AAseq[ListDRMs$AminoAcid[DRMnum]]
    #print(AAatDRMPos)

    #is this AA resistant? compare it with the listed amino acids in the ListDRMs
    TF<-grepl(AAatDRMPos,ListDRMs$Resistant[DRMnum])

    #print(TF)
    # add a true (for resistant) or false (for not resistant) to the PatData dataframe
    PatData[SeqNum,length(names(PatData))]<-TF
  }
}

############ TASK 10   
#Print the first row of the PatData dataframe
#The information in this row comes from which patient and which week? How many trues and falses do you see? What do they mean? 
#How about the 5th row? 

#If you want to just look at the first few rows, you can use the head() function. 
head (PatData)

#Often researchers are interested in the total number of resistance mutations in a sequence.
#Add a column to sum the number of DRMs per sequence.

#Find which columns of the dataframe contain resistance information
DRMcolumns<-which(names(PatData) == ListDRMs$AminoAcid[1]) : which(names(PatData) == ListDRMs$AminoAcid[length(ListDRMs[,1])])
#Create a new column, called NumDRMs, fill with 0s
PatData$NumDRMs<-0
#Sum number of TRUEs in the DRMcolumns for each sequence
for (i in 1:length(PatData[,1])){  
  PatData$NumDRMs[i] <- length(which(PatData[i,DRMcolumns]==TRUE))
  }

############ Task 11
# What is the minimun and maximum number of resistance mutations you see?
# How does the number of DRMs change over time for patient 5 and patient 7?

#The dataframe has data from different weeks in the trial. It is nicer if there would be a column with the week number. That way it is easier to select all the week 0 sequences or all the later sequences. 
# Add column for week}
#Create new column
PatData$week<-0

for (i in 1:length(PatData[,1])){
  print(i)
  name = PatData$name[i]
  #position of "week" in the "name"
  start_week_number = regexpr("week_",name)[1]+5
  week = substr(name,start_week_number,start_week_number+10)
  PatData$week[i] <-week
}

#Make a histogram to show the distribution of the number of DRMs.
#Check out this link to learn more about histograms in R: <http://blog.datacamp.com/make-histogram-basic-r/>

hist(PatData$NumDRMs)
#Now compare the histogram to running the table() function
table(PatData$NumDRMs)

#To get rid of the gaps in the histogram, we can add a "breaks" argument
hist(PatData$NumDRMs, breaks = 0:5)

############ Task 12
#What is the most commonly found number of DRMs in the dataset?
#Write the code to make a histogram for the weeks of the samples in the dataset. 

#We can also look at the distribution of the number of DRMs at week 0 (this is when they started the treatment)
#To do this, we subset the data, to include only those rows where PatData$week==0. 

hist(PatData$NumDRMs[PatData$week==0], breaks = 0:5, main="NumDRMs at week 0")

############ Task 13
#Write the code to make a histogram with the distribution of DRMs from patients who have been on treatment at least half a year. 
#What do you notice? How is this plot different from the previous one?


#Finally, we'll use the function write.csv() to save the dataframe we made in a csv file. 
#The next time we work on the data, we can read in this csv file. 
write.csv(PatData, "PatData306.csv",row.names = FALSE)

?write.csv()
