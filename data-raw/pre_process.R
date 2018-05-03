# Preprocessing of raw-data Alexis 109.

## Lateralization --------------------------------------------------------------
lat <- read.table("data-raw/results_alexis109_earphones.txt", sep = ",", 
                  header = TRUE)

# remove columns speak, vpeak, these were just for debugging
lat <- lat[, c(-12, -13)]

# rename column tau to ici
latname <- names(lat)
latname[7] <- 'ici'
names(lat) <- latname
# ------------------------------------------------------------------------------


## Detection -------------------------------------------------------------------
det <- read.table("data-raw/results_alexis109_earphones_detect.txt", sep = ",", 
                  header = TRUE)

# remove columns speak, vpeak, these were just for debugging
det <- det[, c(-12, -13)]

# rename column tau to ici
detname <- names(det)
detname[7] <- 'ici'
names(det) <- detname
# ------------------------------------------------------------------------------


## Lateralization --------------------------------------------------------------
rove <- read.table("data-raw/results_alexis109_extraexp_rove4ms.txt", sep = ",", 
                  header = TRUE)

# rename column tau to ici
rovename <- names(rove)
rovename[7] <- 'ici'
names(rove) <- rovename
# ------------------------------------------------------------------------------


# Export to ./R ----------------------------------------------------------------
data109lat <- lat
devtools::use_data(data109lat)

data109det <- det
devtools::use_data(data109det)

data109rov <- rove
devtools::use_data(data109rov)
# ------------------------------------------------------------------------------