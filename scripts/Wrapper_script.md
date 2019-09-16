### 1. Download ORFs from CYP8B1 repository of ceglab 
### 2. Validate ORFs 

  - **2.1** - Install `dos2unix` to remove any dos special characters
  - **2.2** - Validate all ORFs using a perlscript via a forloop

### 3. Calculate Mean GC content

  - **3.1** - Download perl script to calculate GC content from the repository of DamienFr.
  - **3.2** - Run the perl script in a forloop for each ORF. Use a window size of 100 with a step size of 10.
  - **3.3** -  Plot the distribution of GC content in R: using the rscript 'gc_content.r'

### 4. Install bedtools & Multiple Sequence Aligners

- [bedtools](https://bedtools.readthedocs.io/en/latest/)  -  v2.26.0
- [PRANK](http://wasabiapp.org/software/prank/prank_installation/)  -  v.140603
- [MUSCLE](https://www.drive5.com/muscle/)  -  v3.8.31
- [MAFFT](https://mafft.cbrc.jp/alignment/software/)  -  v7.450
- [CLUSTALW](http://www.clustal.org/)  -  v2.0.12
- [Guidance2](http://wasabiapp.org/software/pagan/)  -  v2.02
- EXtra packages - [Bioawk](https://github.com/lh3/bioawk).  
    
## 5. 
