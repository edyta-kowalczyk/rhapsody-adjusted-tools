#dependencies

library(biomaRt)
library(tidyr)
library(stringr)
library(plotly)

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("biomaRt")


#load db
mart <- useDataset("hsapiens_gene_ensembl", useMart("ensembl"))

#get gene names to convert
file_dir <- 'C:/Users/10283533/OneDrive - BD/Documents/Bioinformatics_repository/Bioinformatics_clients/schayan_fusion_genes_simon_hass/fusion_genes_and_VDJ/fusion_genes_info'
file_name <- 'fusion_genes_ensembl_ids_from_customer.csv'

file_dir_design <-  'C:/Users/10283533/OneDrive - BD/Documents/Bioinformatics_repository/Bioinformatics_clients/schayan_fusion_genes_simon_hass/fusion_genes_and_VDJ/fusion_genes_info/panel_design_result_files'
file_name_design <- '1546_3_and_5_full_gene_list_panel_details.csv'

data_customer <- read.csv(sprintf("%s/%s", file_dir, file_name), sep = ',', header = FALSE)
data_design <- read.csv(sprintf("%s/%s", file_dir_design, file_name_design), sep = ',' ,header = TRUE)

#mart get transcript IDs and convert to gene names
