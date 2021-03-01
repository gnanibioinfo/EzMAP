# EzMAP : Easy Microbiome Analysis Platform
We introduce a user-friendly microbiome analysis pipeline named as EzMAP (Easy Microbiome Analysis Platform), developed using Java Swings, Java Script and R programming. 
This platform is provided with functionalities for metadata profiling, read pre-processing, sequence processing and classification, OTU (operational taxonomic unit) clustering, 
taxonomy assignment and visualization. Most of the microbial community profiling are implemented by using QIIME2 (Quantitative Insights Into Microbial Ecology) functionalities. 

EzMAP installation requirments
1. JAVA JRE Download for your suitable environment https://www.java.com/en/download/
2. Anaconda/miniconda
3. QIIME2
4. R and R Studio

Working with EzMAP
1. Download the EzMAP rar file and unpack it and place it in EzMAP folder on your desktop.
2. Now create Manifest file (link/path to fastq files),Metadata files (sample descriptions and variables informations) and raw files (refer to Test_data stucture) and place in a EzMAP_Analysis folder on your desktop.
3. Open EzMAP folder and double click on EzMAP.Jar file and click start button on EzMAP screen.
5. Choose the options to work accordingly, Run QIIME2 analysis or Run Downstream Analysis.

Test Dataset
The test dataset consists of 16S rRNA sequencing (Illumina MiSeq) reads from 12 samples (6 from endosphere and 6 from Rhizosphere). These reads were downloaded from the National Center for Biotechnology Information Short Read Archive (accession no. SRP044745). 
The manifest file with link/path to fastq filw of 12 samples is availabe in the test dataset folder under the name Bacteria-se-64-manifest [use any text editors to open and edit]
The metadata file with sample descriptions is available under the name sample-metadata.tsv [use any text editors to open and edit].

EzMAP steps:
1. Open EzMAP with double click on EzMAP.jar
2. Choose either Run Qiime2 Analysis (uses qiime2 pipline)  or Run Downstream analysis (uses R studio)

For QIIME2 Analysis
1. Clcik on Run QIIME2 analysis button
2. Select read format (single-end or Paired-end)
3. Select Working directory (All the computed files will be generated here under results folder)
4. Select Manifest file  (Required to locate the fastq files)
5. Select Metadata file (Required to describe the sample variables)
6. Once selected, click on save button. The configuration file will generated with the paths to working directory, manifest file and metadata file.
7. Click on import sequences button (upon clicking this a termial window will be poped up and a line "source ezMAP_import.sh" will appear in the text area. [copy this and paste in terminal and hit enter button]
9. Once the import is successfull, click on view plot [Reads quality plot will be appear in your default browser]
10. In denoising step, provide the quality trimming paprameters [truncating length and trimming length] and click on proceed. (upon clicking this a termial window will be poped up and a line "source ezMAP_denoising.sh" will appear in the text area. [copy this and paste in terminal and hit enter button]
12. Once denoising step is successfull, click on view files button and check the deniosing statistics and other rooted and unrooted tree files
13. Next click convert biom button to generate the biom format file for downstream analysis. [Default name:table-taxonomy.biom]

For Downstream Analysis
1. First Open R Studio 
2. Click on Run Downstream analysis button (This will open R Studio)
3. iIn R Studio, set the working directory  as Desktop/EzMAP/Downstream or simply paste the below line in R studio and Execute 
4. setwd("~/Desktop/EzMAP/Downstream") "library(shiny) runApp()" paste these lines R studio and run
5. EzMAP shiny App will appear and upload the table-taxonomy.biom file and tree file
6. Phyloseq object will be generated and a summary of phyloseq object will be displayed
7. Use Alpha, Beta, Differential Analysis and Functional Analysis menus 


This README work is in progress. Please visit this page regularly for more updates. Currently EzMAP requires very few manual installation and executions for features like qiime2 activation and opening R studo. The required packages for R will be automatically installed.
