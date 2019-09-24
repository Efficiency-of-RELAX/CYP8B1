## Detecting relaxed selection on CYP8B1 gene using RELAX <img src="http://www.hyphy.org/images/logo.svg" title="RELAX by HyPhy" width="40" height="40">


The objective of this assignment is to analyze the effect of **'gaps'** and **'number of species used'** in detecting relaxed selection by [RELAX](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4327161/). RELAX is a hypothesis testing framework that asks whether the strength of natural selection has been relaxed or intensified along a specified set of test branches. However to test this program, we need to have some known ground truth or control i.e., a sequence known to be under strong relaxed selection. Here we choose the gene CYP8B1 which is found and verified to be under strong relaxed selection in some mammals and birds (which come under a common clade called 'Amniota'). 

The test for the relaxed selection of CYP8B1 gene in the amniotes is carried out as per the pipeline mentioned in the [Shinde et al., 2019](https://link.springer.com/article/10.1007/s00239-019-09903-6?fbclid=IwAR2UL_uHcWkEfqa1GyJsq95N_t_Lcaq7TOn1UpFVNj-2ikDJnUEbHi0ZBCQ#Sec2). The major steps used in detection of the relaxed selection are listed below and a more detailed information is given in projects.

<p align="center">
  <img src="https://www.researchgate.net/profile/Andrei_Lukashkin/publication/323780429/figure/fig2/AS:614316390744064@1523475849079/Tree-of-life-of-amniotes-that-includes-reptiles-birds-and-mammals-All-these-classes-of.png" width="300">
   <img src="https://hqi6ig.dm.files.1drv.com/y4mvy55QaPOJiLUsdPXcbVsBK7uLm4TnpfEvsomw8nemcIAUcXev_SnEEW4aR2Jnfto2LttyBMYXLoW86IovQtphUw351cQ7jpNK1RbipYQnc-4SEr2dr7gooHhLlMczCxrg0J3mX9rG7Sx-FXiaBafTkj-0viM-dJ2-IFA-u-vyFMTjoiQ3KJZh_UrLWAH4xAINzegSFoUi3UXfWCII1_M2Q?width=1423&height=1225&cropmode=none" width="450">>
  </p>

> <- Phylogenetic tree of birds and mammals
> Pipeline to run RELAX on CYP8B1 gene ->
---
&nbsp;

## RELAX on CYP8B1 by Shinde et al., 2019
CYP8B1 is a single exonic gene that determines the ratio of primary bile salts. The code and data provided in this project are part of the below manuscript "Shinde, S.S., Teekas, L., Sharma, S. et al. J Mol Evol (2019). https://doi.org/10.1007/s00239-019-09903-6". A pre-publication pre-print of the same is available here: https://www.biorxiv.org/content/10.1101/714188v1".

### Data is organised into the following folders

<li><span style="text-decoration: underline;">ORFs:</span> Each file in this folder contains the complete open reading from of the CYP8B1 gene starting from start codon all the way till the stop codon</li>
<li><span style="text-decoration: underline;">SAMs:</span> Each file in this folder contains the results of performing SRA blastn search against publically available raw read data from the short read archive (SRA)</li>
<li><span style="text-decoration: underline;">MSAs:</span> Each file in this folder contains the results of multiple sequence alignment of the ORF files using guidance with PRANK, CLUSTALW, MAFFT or MUSCLE as the aligner</li>
<li><span style="text-decoration: underline;">gc_content:</span> The GC content and GC deviation are calculated for each ORF in window size of 100 with a step size of 10. The script plotGC_content.r is used to visualise these results </li>
<li><span style="text-decoration: underline;">scripts:</span> The scripts used for performing the ORF validation, multiple sequence alignment, model testing, tree topology inference and tests for relaxed selection are provided. Contents of this folder (scripts and instructions) along with published software tools should be suffecient to replicate all the results described in the manuscript. </li>
<li><span style="text-decoration: underline;">relaxation_tests:</span> Output files obtained after running the RELAX program implemented in the HYPHY package.</li>
  
  <div style="float: right; margin-left: 30px;"><img title="CYP8B1 analysis workflow" style="float: right;margin-left: 30px;" src="https://raw.githubusercontent.com/ceglab/CYP8B1/master/Workflow_CYP8B1.jpg" align=right height=350/></div>
  
### Prerequisites :

<li><span style="text-decoration: underline;">PRANK (v.140603)</li>
<li>MUSCLE (v3.8.31)</li>
<li>MAFFT (v7.407)</li>
<li>CLUSTALW (2.0.12)</li>
<li>MEGA (10.0.5)</li>  
<li>DAMBE (7.0.58)</li>
<li>bam-readcount (0.8.0)</li>
<li>MUMSA (1.0)</li>  (Lassmann and Sonnhammer 2005)
<li>modeltest-ng</li> (Darriba et al. 2019)   
<li>raxml-ng</li>
<li>HyPhy (2.3.14)</li>   

