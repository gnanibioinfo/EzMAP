# EzMAP : Easy Microbiome Analysis Platform
We introduce a user-friendly microbiome analysis pipeline named as EzMAP (Easy Microbiome Analysis Platform), developed using Java Swings, Java Script and R programming. 
This platform is provided with functionalities for metadata profiling, read pre-processing, sequence processing and classification, OTU (operational taxonomic unit) clustering, 
taxonomy assignment and visualization. Most of the microbial community profiling are implemented by using QIIME2 (Quantitative Insights Into Microbial Ecology) functionalities. 

**EzMAP installation requirments**
1. JAVA JRE Download for your suitable environment https://www.java.com/en/download/
2. Anaconda/miniconda
3. QIIME2
4. R and R Studio

**Unzipping/unpacking the EzMAP folder**
1. Upon downloading the files from this github, Extract the EzMAP-main. 
2. Inside this folder, locate the "EzMAP_Analysis" folder and save it on Desktop . Inside this folder, one should have Bacteria_manifest, sample-metadata and raw_data (folder) )
3. Then copy the **EzMAP.jar** and place it on your Desktop.
4. Next locate the EzMAP.zip and unzip/extract it to desktop as **EzMAP** (This folder should consists of other sub-folders (build,dist,Downstream,.....)). [This should be like ~/Desktop/EzMAP/build.. ].
5. Now on clicking the EzMAP.jar on desktop with two other folders (EzMAP and EzMAP_Analysis), the EzMAP interface will be ready for the analysis.


**Working with EzMAP**
1. Download the EzMAP rar file and unpack it and place it in EzMAP folder on your desktop.
2. Now create Manifest file (link/path to fastq files),Metadata files (sample descriptions and variables informations) and raw files (refer to Test_data stucture) and place in a EzMAP_Analysis folder on your desktop.
3. Open EzMAP folder and double click on EzMAP.Jar file and click start button on EzMAP screen.
5. Choose the options to work accordingly, Run QIIME2 analysis or Run Downstream Analysis.

**Test Dataset**

1.The test dataset consists of 16S rRNA sequencing (Illumina MiSeq) reads from 12 samples (6 from endosphere and 6 from Rhizosphere). These reads were downloaded from the National Center for Biotechnology Information Short Read Archive (accession no. SRP044745). (Runtime for this dataset is approximately ~9 hrs)

2.The manifest file with link/path to fastq files of 12 samples is availabe in the test dataset folder under the name Bacteria-se-64-manifest [use any text editors to open and edit]

3.The metadata file with sample descriptions is available under the name sample-metadata.tsv [use any text editors to open and edit].

4. For testing purpose, the metadata file and manifest file is linked only with four samples (2 from endosphere and 2 from rhizophere).(The runtime for this dataset is approximately 2 hrs)
 

**EzMAP steps:**
1. Download the zip files and extract and store on Desktop and name it as EzMAP (**Please make sure it be as **~/Desktop/EzMAP****) not as (~/Desktop/EzMAP/EzMAP).
2. Open EzMAP with double click on EzMAP.jar
3. On first use of EzMAP, please click on "Install QIIME2" before stating analysis.
4. Once installation is completed, click on "Start Analysis".
5. On this screen, if you have biome file please click on "Run Downstream Analysis" and R studio will popup and EzMAP Application will be opened and upload your biome file and navigate through other menu options.
6. For upstream analysis (Preprocessing, classification and taxonomy assignments) click on "Run qiime2 analysis".
7. Here, one can choose the sequencing read types (single-end and paired-end). The test data set provided here is single-end reads.
8. Provide the working directory, manifest and metadata files (**Place the EzMAP_Analysis folder on Desktop **) and click on save and next.
9. Provide the single end primer information, (in case of  provided test data set: **CCTACGGGNGGCWGCAG**) and click on "Add" and then click on "Execute Sequence Import".
10. Next click on "Execute cutadaptor" and after trimming click on "view quality plot"
11. Next provide the base number (based on the quality plot) to trim and truncate the length of reads (In case of test dataset, **Trim: 0 and Trun: 230**) and click on save and click on the choice of denoising algorithm (In case of test dataset, click on DADA2, which take approximately 2 hrs).
12. On next screen, in case of provided dataset, choose Greengenes option under DADA2 Filtered.
13. On final screen, click on view the files generated through DADA2 and greengenes database taxonomy. click on Build Phylogenetic Tree button and tree files will be generated.
14. On the Main folder (EzMAP_Analysis), a folder named EzMAP_Single_End_Read_Analysis will be generated with multiple subfolders.
15. For downstream analysis, use the biome file "**table-w-tax-meta.biom**" that is generated in the folder "EzMAP_Single_End_Read_Analysis".


**For Downstream Analysis**
1. Open EzMAP with double click on EzMAP.jar
2. Click on Run Downstream analysis button (This will open R Studio)
3. In the EzMAP shiny App upload the **table-w-tax-meta.biom** file and tree file
6. Phyloseq object will be generated and a summary of phyloseq object will be displayed
7. Use Alpha, Beta, Differential Analysis and Functional Analysis menus 


This README work is in progress. Please visit this page regularly for more updates. 
