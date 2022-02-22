
library(sctools)

# Load an example object
s <- readRDS("../data/CIP099_dev.rds")

# Filter the object and check the command log
s <- QualityFiltering(s, min_counts = 500, max_counts = 8000)


