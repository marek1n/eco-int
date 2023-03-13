# in a R script, like this one, place the cursor in from of a command line
# then, press ctrl and enter simultaneously to activate the command in the console

# note that the sentences preceded by "#" are considered a note and are not part of the command line 

# install.packages("corHMM") # installs the package corHMM in your RStudio

require(corHMM) # uploads the mentioned R package (in this case corHMM) into your R project

phy <- readRDS("phy.RDS") # creates an object called phy that contains the phylogeny of the phy file

data <- read.csv2("habitat_trophic.csv") # creates an object called data that contain the data frame of the data file

model_test <- corHMM(phy, data, rate.cat=1) # creates an object called model_test containing the results 
                                            # of the function corHMM which was run on the objects phy and data,
                                            # with only one hidden rate category and all other arguments as default 


saveRDS(model_test, "model_test.RDS") # saves a RDS file containing the object called model_test

write.csv(model_test$solution, "solution.csv") # saves a csv file (which you can open in Excel) named solution that contains
                                          # the object model$solution, which is the rate matrix of evolutionary transitions
                                          # between the different character states
