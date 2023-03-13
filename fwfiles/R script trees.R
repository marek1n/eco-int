
# set working directory (write path to a working directory of your choice) ----

setwd("C:/.../foldername")

# loading the corHMM package will also load other useful packages for data preparation (e.g. ape) ----

library(corHMM)

# or just

library(ape)

# creating an R object that loads the original phylogenetic tree and data frame ----

raw_phy <- read.tree(file = 'GBMB.tre')

# or for a tree in Nexus format use

raw_phy <- read.nexus(filename)

data <- read.csv("data.csv")

# Pruning the phylogenetic tree based on the taxa/species overlaping with the data ----

species_overlap <- intersect(data$species, raw_phy$tip.label)
# the command above creates a vector with the species included in both the phylogenetic tree and in the data frame 

length(species_overlap)
# the command above returns how many species are included in the vector "species_to_keep"

phy <- keep.tip(raw_phy, tip = species_overlap)
# the command above creates a new phylogenetic tree that includes only the overlapped species 


max(branching.times(phy))
# the command above returns the age of the phyogenetic tree root; this will allow you to calculate transition rate per e.g. 100MY

saveRDS(phy, "phy.rds") # saves the object phy as a RDS file

phy <- readRDS("phy.rds") # creates an object named model that reads the object model

write.tree(phy, file='phy.txt')

phy <- read.tree("phy.txt")

save.image("AllObjects.Rdata") # saves all the objects in the Environment created with the above

raw_species_list <- raw_phy$tip.label # creates an object vector with all the species listed in the phylogeny raw_phy


