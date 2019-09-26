## Effect of gaps in detecting Relaxed Selection by RELAX <img src="http://www.hyphy.org/images/logo.svg" title="RELAX by HyPhy" width="40" height="40">

The objective of this assignment is to analyze the effect of **gaps** and **number of species** in efficiency of detecting relaxed selection by [RELAX](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4327161/) in terms of :
- number of gaps
- length of gaps 
- number of species
---
### What is Relaxed Selection ?

**Relaxed selection** is a selective phenomena that occurs when selective pressures are either eliminated or reduced.

- Biotic sources :
  - Predation elimination 
  - Elimination of pathogen
- Abiotic sources :
  - Changes in light and temperature and water
  - Changes soil and mineral composition 

---
### Alternatives to Relaxed selection.

Selection of any form (balancing, directional, etc.) can be relaxed. An example from [ Lahti et al. 2009](https://doi.org/10.1016/j.tree.2009.03.010) is here.

<p align="middle">
   <img src="https://iai6ig.dm.files.1drv.com/y4mYcecLdhoFc6RqOL3Yqlb-jPDalK0divdYbrYgCn7uZfl7q-HyQSroMtWbChaJd-Ros8eucC4xPtgJS_Heb8GupoUAfm3TnY_HRsjJ7coZ11N9uLrKYCCtN7_KqUr9IDLT9FWEM9n7fzDA0tTTPk7Z2fCqXMqKHblJ-4vMxWhpW9C6INPTAEjm7crBqp7OeW20dgpbXPgZCgR7FpU8TUI3g?width=960&height=457&cropmode=none" width="750">
 </p>

       A hypothetical environmental change from an ancestral condition : possible outcomes -> (a) to (e)

---
### Detection of selection in Genomic data.

We can detect signatures of selection from DNA sequence of organisms. The past fifty six years have seen the development and application of numerous statistical methods to identify genomic regions that appear to
be shaped by natural selection. Natural selection is based on the simple observation of fitness-enhancing traits. 

<p align="middle">
   <img src="https://fki6ig.dm.files.1drv.com/y4muJuLal2yz70SMOfsuaa_qY_3HZaOKj89iOKAHUnzD2XHklC5mlxwyrJFfVCzWnrG2ZHFTY5Chqg9o_Ji47fdvU8xwZB9MRIpN_mVNSwDZOyoTn6A-bdcZ_wfiyWKM0fwDqN802EpaQ-K9ceIrXSFH8yxlSpvDEAsO9sx013Tc-AN4WEX3Vh6f-kzEUXDK9PFYBeb7I5zC_eLXI0BVGwIrQ?width=960&height=113&cropmode=none" width="750">
 </p>
 
                       The way in which selection become observable and quantifiable.
 
Given that selection operates at the level of the phenotype, alleles showing evidence of selection are likely to be of functional relevance. There are several approaches available to detect selection at macroevolutionary scale. 

What these methods does is :

- identify sequences that are likely to be functional (coding or conserved) 
- Then search for lineage-specific accelerations in the rate of evolution.

Such accelerations are indicated by an excess of substitutions relative to the baseline mutation rate, which can be calculated from the number and rate of synonymous mutations.

---
### Method to use ?

Here we used a general hypothesis testing framework called **RELAX** from [Hyphy package](http://www.hyphy.org/). HyPhy (Hypothesis Testing using Phylogenies) is an open-source software package for the analysis of genetic sequences for inferring natural selection using techniques of :
- phylogenetics
- molecular evolution
- machine learning

HyPhy distributes a variety of methods for inferring the strength of natural selection from the genetic data. In the case of branch-based methods for detecting selection, there is Relax.

<p align="center">
  <img src="https://e6i6ig.dm.files.1drv.com/y4mM7dfKvEtn8e1Qn-DRQ-K5RouPlps1GYXnhFNvqH5e5Lv4OsJ5XxUKDVoTBA-1yX3bhEsHKMf9r8n7jUHPz_11PtKzICsk8nyeeoStNV9tLnXgZR-0tqkFi_hVfzEPEURe2hHZVewp9Ul2T_TmMGVTTeXDnQmwt6KJtXxITwTuy0csMYrftpunVrElyuF_BsMXt1nMXxZY7NQSQJy_DPShg?width=1685&height=1124&cropmode=none" width="650" title="Tools to selection">
  </p>
  <p align="center">
  
    The Decision tree : to find the appropriate method for detecting the molecular process of interest. 

RELAX is a hypothesis testing framework that asks whether the strength of natural selection has been relaxed or intensified along a specified set of test branches.

---
### What are Gaps ?

Here the objective is to analyze the effect of gaps in detecting relaxed selection. Essentially, a gap occurs if something happens in our genome that can't be explained by uniformity and is also more than just mis-sequencing. 

Here are some types of genome assembly gaps from [Chaisson et al., 2015](https://www.ncbi.nlm.nih.gov/pubmed/26442640) :

<div style="float: right; margin-left: 30px;"><img title="Types of genome assembly gaps." style="float: right;margin-left: 30px;" src="https://i.stack.imgur.com/JPYZY.jpgg" align=right height=300/></div>
                      

(a) **Sequence-coverage gaps**: absence or reduction in sequence reads at that location.  

(b) **Segmental duplication-associated gaps**: high sequence identity make read overlaps ambiguous.

(c) **Satellite-associated gaps**: higher-order tandem arrays of repetitive sequence cause read 'pileups'.

(d) **Muted gaps**: Contracted assembly relative to true genome.

One of the first problems anyone who do sequencing have to tackle is to distinguish the gap source between sequencing or alignment error versus actual indel in DNA. In such cases we have to minimize the false positives (type 1 error) and false negatives (type 2 error).

---
### Objective :

The presence of gaps can lead to several problems and ambiguities in assembly or alignment and hence the downstream analysis. These could lead to misinterpretation of the biology of data we are analyzing. As a matter of fact, here we try to analyze how the presence of gaps affect a particular downstream analysis - inference of strength of Natural Selection.   

Two approaches to do this:

(1) Using a gene known to be under relaxed selection.

(2) Using simulated data.

In both cases we variably mask certain parts of the sequence as gaps and analyze the p values and k values inferred by Relax.
To mask the sequence we used **Bedtool's** commands :
- **random** - generate a random set of intervals.  
- **maskfasta** -  masks sequences based on intervals.

<p align="middle">
  <img src="https://hahvlw.dm.files.1drv.com/y4mb3IO83k7bJJMg5bXgxAly5D4ImA0FhPXepySdGky9b2TOyWDCZOW6UuOfYohE6jp_cVT-AXxrwoUvkq_avnSnpkGLTXXKOlBSmsk04Mt-USdynmSbwCtoYR_DUBS49MZcJttpFq2DW2Zt-OBjkWpcdUPi6GEIWPeieLEFgN_2_Gv_N3p0TSAN6mqcyrfvCqIGxMYJvFAZg5UPU474l-YhA?width=959&height=287&cropmode=none" width="700">
 </p>
 
                          How the bedtools 'random' and 'maskfasta' command works.

For the first approach we took a gene known to be under strong relaxed selection. Here we choose the gene **CYP8B1** which is found and verified to be under strong relaxed selection in some mammals and birds (which come under a common clade called 'Amniota') by [Shinde et al., 2019](https://link.springer.com/article/10.1007/s00239-019-09903-6?fbclid=IwAR2UL_uHcWkEfqa1GyJsq95N_t_Lcaq7TOn1UpFVNj-2ikDJnUEbHi0ZBCQ#Sec2). 

<p align="center">
  <img src="https://taz02g.dm.files.1drv.com/y4mu1DshNT16gYNWFpWnG5Yc7k7xE0tPAv-pyMjrl0ogXbJxMX-5Fd3zfAIRcLtXabY1p1gT31qAm4Jm2Zu-bp6rTgAMAY4Gk3zThXyy4Vt7iKKgupjdf3ZjwNqoIzh_xOwxFpIR_wc9kfPZjPQmT-fGu_OxC7UITmLAaHGRHV5TbNd7umfu_xDAJTBXoiGNzgLAZ_vC_wKSySlhVxkBHShCQ?width=359&height=381&cropmode=none" width="380">
  <img src="https://hki6ig.dm.files.1drv.com/y4mh8e8-Q0lnc4OlpVCjNPNqOkF-KIIdGO6smfwMhjM4eecVzfA97gUcWmfKCvY3y5tQePZm8VzTaiq4x3KvO_CQ9AyZFhlczD1mfJgVDgea4zAgcVI1dr2lxck6UsovPheBW8I7HSLImYkVCAktBdawuaJ0RNO76eTKZxNIJ3Ea0a_vyZ9ZrGvg2dmcVlHjb-KkPeGCt3tItAUh4JqQA_Dkw?width=397&height=442&cropmode=none" width="380">
</p> 

                                A small overview about CYP8B1 gene and protein

CYP8B1 is a single exonic gene that determines the ratio of primary bile salts. The loss of this gene has been linked to lack of cholic acid in naked mole rats, elephants and manatees. The Sagar et., 2019 used CYP8B1 gene ORFs from more than 200 species of birds and mammals to look for signatures of relaxed selection.

<p align="middle">
   <img src="https://hqhvlw.dm.files.1drv.com/y4mxxn8VKeSKAUsrWGeXZFZHH6hG_8MHES2STtqms_d6d4EZ6BrYbXOlMTH3uOZcQiYwbDJTlJ14bnOUn00fkvaT4awsyExwbPsTmjNxkKPR3B4fDvqrJcA-eZtqb17IbSj7VEnXVdDa_yru_jW2Ee5rCM2WA5JRlh6o-5roBkbCbYt-7QVMaRCvPiqXDzOLlbJBwH6Osql_S15yB17PyIgtw?width=1308&height=1124&cropmode=none" width="650">
 </p>

                   The taxonomic orders in Sagar et al., 2019 study are boxed red ~ 15 groups.   

The test for the relaxed selection of CYP8B1 gene in the amniotes is carried out as per the pipeline mentioned in the Shinde et al., 2019. The major steps used in detection of the relaxed selection are listed below and a more detailed information is given in projects.

---

### Workflow
  <div style="float: right; margin-left: 30px;"><img title="CYP8B1 analysis workflow" style="float: right;margin-left: 30px;" src="https://raw.githubusercontent.com/ceglab/CYP8B1/master/Workflow_CYP8B1.jpg" align=right height=400/></div>
  
#### Prerequisites :

<li><span style="text-decoration: underline;">PRANK (v.140603)</li>
<li>MUSCLE (v3.8.31)</li>
<li>MAFFT (v7.407)</li>
<li>CLUSTALW (2.0.12)</li>
<li>DAMBE (7.0.58)</li>
<li>bam-readcount (0.8.0)</li>
<li>MUMSA (1.0)</li> 
<li>modeltest-ng</li>   
<li>raxml-ng</li>
<li>HyPhy (2.3.14)</li>   

---

### Results

#### Data is organised into the following folders


<li><span style="text-decoration: underline;">ORFs:</span> Each file in this folder contains the complete open reading from of the CYP8B1 gene starting from start codon all the way till the stop codon</li>
<li><span style="text-decoration: underline;">SAMs:</span> Each file in this folder contains the results of performing SRA blastn search against publically available raw read data from the short read archive (SRA)</li>
<li><span style="text-decoration: underline;">MSAs:</span> Each file in this folder contains the results of multiple sequence alignment of the ORF files using guidance with PRANK, CLUSTALW, MAFFT or MUSCLE as the aligner</li>
<li><span style="text-decoration: underline;">gc_content:</span> The GC content and GC deviation are calculated for each ORF in window size of 100 with a step size of 10. The script plotGC_content.r is used to visualise these results </li>
<li><span style="text-decoration: underline;">scripts:</span> The scripts used for performing the ORF validation, multiple sequence alignment, model testing, tree topology inference and tests for relaxed selection are provided. Contents of this folder (scripts and instructions) along with published software tools should be suffecient to replicate all the results described in the manuscript. </li>
<li><span style="text-decoration: underline;">relaxation_tests:</span> Output files obtained after running the RELAX program implemented in the HYPHY package.</li>
  

