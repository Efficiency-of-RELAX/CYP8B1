# Testing RELAX on CYP8B1 gene in Birds & Mammals 
CYP8B1 is a single exonic gene that determines the ratio of primary bile salts. The code and data provided in this project are part of the below manuscript "Shinde, S.S., Teekas, L., Sharma, S. et al. J Mol Evol (2019). https://doi.org/10.1007/s00239-019-09903-6". A pre-publication pre-print of the same is available here: https://www.biorxiv.org/content/10.1101/714188v1

### Data is organised into the following folders

<li><span style="text-decoration: underline;">ORFs:</span> Each file in this folder contains the complete open reading from of the CYP8B1 gene starting from start codon all the way till the stop codon</li>
<li><span style="text-decoration: underline;">SAMs:</span> Each file in this folder contains the results of performing SRA blastn search against publically available raw read data from the short read archive (SRA)</li>
<li><span style="text-decoration: underline;">MSAs:</span> Each file in this folder contains the results of multiple sequence alignment of the ORF files using guidance with PRANK, CLUSTALW, MAFFT or MUSCLE as the aligner</li>
<li><span style="text-decoration: underline;">gc_content:</span> The GC content and GC deviation are calculated for each ORF in window size of 100 with a step size of 10. The script plotGC_content.r is used to visualise these results </li>
<li><span style="text-decoration: underline;">scripts:</span> The scripts used for performing the ORF validation, multiple sequence alignment, model testing, tree topology inference and tests for relaxed selection are provided. Contents of this folder (scripts and instructions) along with published software tools should be suffecient to replicate all the results described in the manuscript. </li>
<li><span style="text-decoration: underline;">relaxation_tests:</span> Output files obtained after running the RELAX program implemented in the HYPHY package.</li>
  
  <div style="float: right; margin-left: 30px;"><img title="CYP8B1 analysis workflow" style="float: right;margin-left: 30px;" src="Workflow_CYP8B1.jpg?raw=true" align=right height=450/></div>
  
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

