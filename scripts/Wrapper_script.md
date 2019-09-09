## 1. Download ORFs from CYP8B1 repository of ceglab 

```
       git clone https://github.com/ceglab/CYP8B1.git
```

## 2. Validate ORFs 

#### 2.1 Install `dos2unix` to remove any dos special characters

```sh
       sudo apt-get install dos2unix
```

#### 2.2 Validate all ORFs using a perlscript via a forloop

- Validate the ORFs before running RELAX. <!-- AUTO-GENERATED-CONTENT:START (TOC:collapse=true&collapseText="Click to expand") -->
<details>
<summary>"It will detect :"</summary>
 
   - In-frame stop codons.
   - DNA "ambiguity" characters other than N.
   - lack of stop codon at the end of the sequence.
   - lack of start codon at the beginning of start codon.

</details>
<!-- AUTO-GENERATED-CONTENT:END -->


- Precaution : Don't try to manually update `perl`. 

```
      cd /home/ceglab8/workspace/phd/research/efficiency_of_RELAX/CYP8B1
      for i in `ls -1 ORFs/*fa`
      do
      echo -ne "$i\t"
      dos2unix $i
      perl scripts/ORFvalidator.pl $i
      done
```
- Result looks like this : All sequences from each folder are converted & validated.

<p align="center">
  <img src="https://lkuvng.dm.files.1drv.com/y4m_Ux9WsWuTOnAwaszIqYGZsDdwOu9j8I_aBPwnLU_93hG_-_ZgtQdP-RYUlPbWhy9-7WP1ri15gJzKkyVigjLuziGLzjkdwWJpEdu_2cxbCIikHBHbksxyc2xz4iLaL1cNJ1iw7QS8Kfy2yNG37wVzbV9CA2zAWYYjqcq30tLq10UfpOH_5nOx8F01HDk5LovNbpLesRki8HAeIhB-xDo7Q?width=942&height=236&cropmode=none" width="680" title="output of ORF validation">
  </p>

### 3. Calculate Mean GC content

#### 3.1 Download perl script to calculate GC content from the repository 'GC_content_in_sliding_window' of DamienFr

`git clone https://github.com/DamienFr/GC_content_in_sliding_window.git`

#### Run the perl script in a forloop for each ORF. Use a window size of 100 with a step size of 10.

for i in `ls -1 $GITDUMP/CYP8B1/ORFs/*.fa`; do j=`echo $i|cut -f 7 -d '/'`; cp $i .; perl $GITDUMP/CYP8B1/scripts/gc_content.pl --fasta $j --window 100 --step 10; done|grep "the mean GC content"|awk '{print $8,$10}' > ../Mean_GC.txt

#Perform QC on the alignments generated using Guidance and generate a QC report
for i in `ls -1 $GITDUMP/CYP8B1/ORFs/*.fa`
do
j=`echo $i|cut -f 6 -d '/'|cut -f 1 -d '.'`
k=`echo $i|cut -f 6 -d '/'`
mkdir $j
cd $j
cp $i .
$GITDUMP/CYP8B1/scripts/Alignment_QC.sh $k
cp "$k"_MAFFT.aln $GITDUMP/CYP8B1/MSAs
cp "$k"_PRANK.aln $GITDUMP/CYP8B1/MSAs
cp "$k"_MUSCLE.aln $GITDUMP/CYP8B1/MSAs
cp "$k"_CLUSTALW.aln $GITDUMP/CYP8B1/MSAs
cd ..
done

