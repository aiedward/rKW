#load packages
library(dplyr)

#load data
load_data <- function(path){
       files <- dir(path, pattern = '\\.csv', full.names = TRUE)
       tables <- lapply(files, read.csv)
       do.call(rbind, tables)
}

credentialsData <- load_data("bgData")
crosswalk <- read.csv("onetCodeDescriptionCrosswalk.csv")
#combine data
#credentialsForYear <- (lapply(Sys.glob("*.csv"), read.csv))
#credentialsForYear <- lapply(credentialsForYear, rbind)
#credentialsForYear <- as.data.frame(credentialsForYear)
#Get rid of NA's d <- d[!is.na(d)]

credentialOccupations <- credentialsData%>%
       filter(O.NET.CODE != "N/A")%>%
       select(Employer, City, Title, O.NET.CODE, NAICS.CODE, JobDate, JobUrl) #Select necessary variables
       
#Take off last two digits of Onet Code
credentialOccupations$O.NET.CODE <- strtrim(credentialOccupations$O.NET.CODE, 6)
     

credentialOccupations <- merge(credentialOccupations, crosswalk, by="O.NET.CODE")
credentialOccupations <- credentialOccupations%>%
       rename(Occupation = Title.y)%>%
       rename(JobTitle = Title.x)

count(credentialOccupations, Occupation, sort = TRUE)

save(credentialOccupations, file = "credentialOccupations.Rda")




