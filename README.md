## Detecting relaxed selection on CYP8B1 gene using RELAX <img src="http://www.hyphy.org/images/logo.svg" title="RELAX by HyPhy" width="40" height="40">


The objective of this assignment is to analyze the effect of **'gaps'** and **'number of species used'** in detecting relaxed selection by [RELAX](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4327161/) in terms of :
- number of gaps
- length of gaps 
- number of species.
---
**Relaxed selection** is a selective phenomena that occurs when selective pressures are either elimated or reduced.

- Biotic examples 
  - Predation elimination 
  - Elimination of pathogen
- Abiotic examples
  - Changes in light and temperature and water
  - Changes soil and mineral composition 

---

Selection of any form (balancing, directional, etc.) can be relaxed. An example from [ Lahti et al. 2009](https://doi.org/10.1016/j.tree.2009.03.010) is here.

- A hypothetical environmental change from an ancestral condition : possible outcomes -> (a) to (e)
<p align="middle">
   <img src="https://iai6ig.dm.files.1drv.com/y4mYcecLdhoFc6RqOL3Yqlb-jPDalK0divdYbrYgCn7uZfl7q-HyQSroMtWbChaJd-Ros8eucC4xPtgJS_Heb8GupoUAfm3TnY_HRsjJ7coZ11N9uLrKYCCtN7_KqUr9IDLT9FWEM9n7fzDA0tTTPk7Z2fCqXMqKHblJ-4vMxWhpW9C6INPTAEjm7crBqp7OeW20dgpbXPgZCgR7FpU8TUI3g?width=960&height=457&cropmode=none" width="750">
 </p>

---
We can detect selection or signatures of selection from DNA sequence of organisms. Natural selection is based on the simple observation that fitness-enhancing traits, i.e.,

<p align="middle">
   <img src="https://fki6ig.dm.files.1drv.com/y4muJuLal2yz70SMOfsuaa_qY_3HZaOKj89iOKAHUnzD2XHklC5mlxwyrJFfVCzWnrG2ZHFTY5Chqg9o_Ji47fdvU8xwZB9MRIpN_mVNSwDZOyoTn6A-bdcZ_wfiyWKM0fwDqN802EpaQ-K9ceIrXSFH8yxlSpvDEAsO9sx013Tc-AN4WEX3Vh6f-kzEUXDK9PFYBeb7I5zC_eLXI0BVGwIrQ?width=960&height=113&cropmode=none" width="750">
 </p>
 
Given that selection operates at the level of the phenotype, alleles showing evidence of selection are likely to be of functional relevance. There are several approaches available to detect selection at macroevolutionary scale. 
What these methods does is :

- identify sequences that are likely to be functional (either because they code for proteins or because they are conserved among different species) 
- Then search for lineage-specific accelerations in the rate of evolution.

Such accelerations are indicated by an excess of substitutions relative to the baseline mutation rate, which can be calculated from the rate of synonymous mutations.

---
Here we used a general hypothesis testing framework called **RELAX** from [Hyphy package](http://www.hyphy.org/). HyPhy (Hypothesis Testing using Phylogenies) is an open-source software package for the analysis of genetic sequences for inferring natural selection using techniques of :
- phylogenetics
- molecular evolution
- machine learning

HyPhy distributes a variety of methods for inferring the strength of natural selection from the genetic data. In the case of branch-based methods for detecting selection, there is Relax.

<p align="center">
  <img src="https://e6i6ig.dm.files.1drv.com/y4mM7dfKvEtn8e1Qn-DRQ-K5RouPlps1GYXnhFNvqH5e5Lv4OsJ5XxUKDVoTBA-1yX3bhEsHKMf9r8n7jUHPz_11PtKzICsk8nyeeoStNV9tLnXgZR-0tqkFi_hVfzEPEURe2hHZVewp9Ul2T_TmMGVTTeXDnQmwt6KJtXxITwTuy0csMYrftpunVrElyuF_BsMXt1nMXxZY7NQSQJy_DPShg?width=1685&height=1124&cropmode=none" width="650" title="Tools to selection">
  </p>
  <p align="center">
  
> The Decision tree made using datamonkey : to find the appropriate method for detecting the molecular process of interest. >

RELAX is a hypothesis testing framework that asks whether the strength of natural selection has been relaxed or intensified along a specified set of test branches.

---
Here the objective is to analyze the effect of gaps in detecting relaxed selection. Essentially, a gap occurs if something happens in our genome that can't be explained by uniformity and is also more than just mis-sequencing.

<div style="float: right; margin-left: 30px;"><img title="Logo by @gregcaporaso." style="float: right;margin-left: 30px;" src="https://i.stack.imgur.com/JPYZY.jpgg" align=right height=300/></div>

(a) Sequence-coverage gaps: absence or reduction in sequence reads at that location.  

(b) Segmental duplication-associated gaps: high sequence identity make read overlaps ambiguous.

(c) Satellite-associated gaps: higher-order tandem arrays of repetitive sequence cause read 'pileups'.

(d) Muted gaps: Contracted assembly relative to true genome.

However to test this program, we need to have some known ground truth or control i.e., a sequence known to be under strong relaxed selection. Here we choose the gene CYP8B1 which is found and verified to be under strong relaxed selection in some mammals and birds (which come under a common clade called 'Amniota'). 

---

<p align="middle">
  <img src="https://i.stack.imgur.com/JPYZY.jpgg" width="350">
  <img src="https://bedtools.readthedocs.io/en/latest/_images/maskfasta-glyph.png"width="350">
   <img src="https://bedtools.readthedocs.io/en/latest/_images/random-glyph.png" width="350">
 </p>

<p align="middle">
  <img src="https://www.researchgate.net/profile/Andrei_Lukashkin/publication/323780429/figure/fig2/AS:614316390744064@1523475849079/Tree-of-life-of-amniotes-that-includes-reptiles-birds-and-mammals-All-these-classes-of.png" width="350">
   <img src="https://i.stack.imgur.com/JPYZY.jpgg" width="450">
   <img src="https://hqi6ig.dm.files.1drv.com/y4mvy55QaPOJiLUsdPXcbVsBK7uLm4TnpfEvsomw8nemcIAUcXev_SnEEW4aR2Jnfto2LttyBMYXLoW86IovQtphUw351cQ7jpNK1RbipYQnc-4SEr2dr7gooHhLlMczCxrg0J3mX9rG7Sx-FXiaBafTkj-0viM-dJ2-IFA-u-vyFMTjoiQ3KJZh_UrLWAH4xAINzegSFoUi3UXfWCII1_M2Q?width=1423&height=1225&cropmode=none" width="650">
 </p>

img src="https://hqi6ig.dm.files.1drv.com/y4mvy55QaPOJiLUsdPXcbVsBK7uLm4TnpfEvsomw8nemcIAUcXev_SnEEW4aR2Jnfto2LttyBMYXLoW86IovQtphUw351cQ7jpNK1RbipYQnc-4SEr2dr7gooHhLlMczCxrg0J3mX9rG7Sx-FXiaBafTkj-0viM-dJ2-IFA-u-vyFMTjoiQ3KJZh_UrLWAH4xAINzegSFoUi3UXfWCII1_M2Q?width=1423&height=1225&cropmode=none" width="650"

---

The test for the relaxed selection of CYP8B1 gene in the amniotes is carried out as per the pipeline mentioned in the [Shinde et al., 2019](https://link.springer.com/article/10.1007/s00239-019-09903-6?fbclid=IwAR2UL_uHcWkEfqa1GyJsq95N_t_Lcaq7TOn1UpFVNj-2ikDJnUEbHi0ZBCQ#Sec2). The major steps used in detection of the relaxed selection are listed below and a more detailed information is given in projects.


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
<li>MUMSA (1.0)</li> 
<li>modeltest-ng</li>   
<li>raxml-ng</li>
<li>HyPhy (2.3.14)</li>   

