# CYP8B1
CYP8B1 is a single exonic gene that determines the ratio of primary bile salts. The code and data provided in this project are part of the below manuscript. The scripts and data are organised to ensure the integrity, credibility and replicability of the results reported. However, the goal of this repository is not to release a fully-automate pipeline and is beyond the scope of this manuscript. You can access/cite the publication with the following information "Shinde, S.S., Teekas, L., Sharma, S. et al. J Mol Evol (2019). https://doi.org/10.1007/s00239-019-09903-6". A pre-publication pre-print of the same is available here: https://www.biorxiv.org/content/10.1101/714188v1

<h2 style="text-align: center;"><strong>Signatures of relaxed selection in the <em>CYP8B1</em> gene of birds and mammals</strong></h2>
<p style="text-align: center;">Sagar Sharad Shinde<sup>1</sup>, Lokdeep Teekas<sup>1</sup>, Sandhya Sharma<sup>1</sup>, Nagarjun Vijay<sup>1</sup></p>
<p style="text-align: center;"><sup>1</sup>Computational Evolutionary Genomics Lab, Department of Biological Sciences, IISER Bhopal, Bhauri, Madhya Pradesh, India</p>
<p style="text-align: center;">*Correspondence: <a href="mailto:nagarjun@iiserb.ac.in">nagarjun@iiserb.ac.in</a></p>

<span style="text-decoration: underline;">Data is organised into the following folders:</span>
<ol>
<li><span style="text-decoration: underline;">ORFs:</span> Each file in this folder contains the complete open reading from of the CYP8B1 gene starting from start codon all the way till the stop codon</li>
<li><span style="text-decoration: underline;">SAMs:</span> Each file in this folder contains the results of performing SRA blastn search against publically available raw read data from the short read archive (SRA)</li>
<li><span style="text-decoration: underline;">MSAs:</span> Each file in this folder contains the results of multiple sequence alignment of the ORF files using guidance with PRANK, CLUSTALW, MAFFT or MUSCLE as the aligner</li>
<li><span style="text-decoration: underline;">gc_content:</span> The GC content and GC deviation are calculated for each ORF in window size of 100 with a step size of 10. The script plotGC_content.r is used to visualise these results </li>
<li><span style="text-decoration: underline;">scripts:</span> The scripts used for performing the ORF validation, multiple sequence alignment, model testing, tree topology inference and tests for relaxed selection are provided. Contents of this folder (scripts and instructions) along with published software tools should be suffecient to replicate all the results described in the manuscript. </li>
<li><span style="text-decoration: underline;">relaxation_tests:</span> Output files obtained after running the RELAX program implemented in the HYPHY package.</li>
</ol>
<p align="center">
  <img src="Workflow_CYP8B1.jpg?raw=true" width="350" title="CYP8B1 analysis workflow">
</p>

<span style="text-decoration: underline;">Prerequisites:</span>
<ol>
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
<h2 style="text-align: center;"><strong>Results</strong></h2>
<p align="center">
  <img src="/relaxation_tests/Wombat_Figure_Extra_1.jpeg?raw=true" width="350" title="Wombat relax test tree topologies">
</p>

  
