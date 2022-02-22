################################################################################
# Design notes:
################################################################################
# 
# 1. Build a Seurat object from the raw cellranger data as described in an
#    excel file.
#    - Should save which cells passed the cellranger filtering if that 
#      information is available.
#    - Should be able to handle h5 files if raw data is not available.
#
# 2. Add the metadata from an excel sheet into the Seurat object.
# 
# 3. Quality filtering based on counts and number of features. This filtering 
#    should be logged in a Seurat command log.
#
# 4. Function for calculating scores that can use the standard AddModuleScore 
#    or the UCell package (or maybe just the average as a quick alernative?)
# 
# 5. Create generic function for the creation of boxplots with p-values that can
#    make plots with and without facets.



#' Builds Seurat object from raw data. The samples and data paths to the raw 
#' Cellranger data are read from an excel manifest file.
#' 
#' @return 
#' @export
BuildSeuratObject <- function(
  file,
  sheet,
  verbose = TRUE
) {
  
  # TODO: Also allow reading of a regular CSV file instead of only Excel (?)
  # Load the Excel sheet
  
  #
  
  #
  
}



#' Reads metadata from Excel file. Adds new columns but can also be used to 
#' replace existing columns.
#' 
#' @param file Path of the excel file that contains the metadata.
#' @param sheet The excel sheet that should be read.
#' 
#' @return
#' @export
ReadMetaData <- function(
  file,
  sheet
) {
  
}



#' Calculates a signature score for a given set of features and adds it to the 
#' object metadata.
#' 
#' @param object
#' @param features
#' @param assay
#' @param slot
#' @param name
#' 
#' @importFrom Seurat AddModuleScore
#' @importFrom UCell AddModuleScore_UCell
#' 
#' @return
#' @export
AddSignatureScore <- function(
  object,
  features,
  assay,
  slot,
  name
) {
  
}



#' Quality filtering
#'
#' @param object Seurat object
#' @param assay Seurat assay to use for the quality filtering.
#' @param min_counts Minimum number of counts per, below which barcodes should be excluded.
#' @param max_counts Maximum number of counts, above which barcodes should be excluded.
#' @param min_feature Minimum number of features, below which barcodes should be excluded.
#' @param max_feature Maximum number of features, above which barcodes should be excluded.
#' @param max_mito Maximum percentage of mitochondrial genes, above which barcodes should be excluded.
#'
#' @importFrom SeuratObject LogSeuratCommand
#' 
#' @return
#' @export
QualityFiltering <- function(
  object,
  assay = "RNA",
  min_counts = 300,
  max_counts = 8000,
  min_feature = 200,
  max_feature = Inf,
  max_mito = 25
) {
  
  # Check if mitochondrial score exists
  
  # Prepare the expression
  expr <- paste0("nCount_RNA", " > ", min_counts, " & ", "nCount_RNA", " < ", max_counts)
  expr <- paste0(expr, " & ", "nFeature_RNA", " > ", min_feature, " & ", "nFeature_RNA", " < ", max_feature)
  expr <- paste0(expr, " & ", "percent.mt", " < ", max_mito)
  expr <- paste0("subset(object, subset = ", expr, ")")

  # Subset the seurat object by applying the expression
  object <- eval(parse(text=expr))

  # Log the command
  object <- LogSeuratCommand(object, return.command = F)
  
  return(object)
}

  
  
  
  
  
  
  
  




















































