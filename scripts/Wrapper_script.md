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

<!-- AUTO-GENERATED-CONTENT:START (TOC:collapse=true&collapseText="Click to expand") -->
<details>
<summary>Validate the ORFs before running RELAX - :point_right: Why?</summary>
 
 - To detect :
   - In-frame stop codons.
   - DNA "ambiguity" characters other than N.
   - lack of stop codon at the end of the sequence.
   - lack of start codon at the beginning of start codon.

</details>
<!-- AUTO-GENERATED-CONTENT:END -->

```
      cd /home/ceglab8/workspace/phd/research/efficiency_of_RELAX/CYP8B1
      for i in `ls -1 ORFs/*fa`
      do
      echo -ne "$i\t"
      dos2unix $i
      perl scripts/ORFvalidator.pl $i
      done
```

<!-- AUTO-GENERATED-CONTENT:START (TOC:collapse=true&collapseText="Click to expand") -->
<details>
<summary>Precaution : Don't try to manually upgrade `perl` - :point_right: Why?</summary>

  - If you upgrade manually- both version of perl will exist together.
  - Then if you try running perl scripts- it may not be able to find the required modules.
  - Since the path for the modules is changed, it can't find the modules.
  - Solution : 
    - Install the missing module forcefully. 
    
          cpanm --sudo --force Bio::SeqIO
    
    - If necessary, change the Shebang line.

          #!/usr/bin/env perl         to       #!/usr/bin/perl

      
</details>
<!-- AUTO-GENERATED-CONTENT:END -->

- Result looks like this : All sequences from each folder are converted & validated.

<p align="center">
  <img src="https://lkuvng.dm.files.1drv.com/y4m_Ux9WsWuTOnAwaszIqYGZsDdwOu9j8I_aBPwnLU_93hG_-_ZgtQdP-RYUlPbWhy9-7WP1ri15gJzKkyVigjLuziGLzjkdwWJpEdu_2cxbCIikHBHbksxyc2xz4iLaL1cNJ1iw7QS8Kfy2yNG37wVzbV9CA2zAWYYjqcq30tLq10UfpOH_5nOx8F01HDk5LovNbpLesRki8HAeIhB-xDo7Q?width=942&height=236&cropmode=none" width="680" title="output of ORF validation">
  </p>

## 3. Calculate Mean GC content

#### 3.1 Download perl script to calculate GC content from the repository of DamienFr.

```
git clone https://github.com/DamienFr/GC_content_in_sliding_window.git
```

#### 3.2 Run the perl script in a forloop for each ORF. Use a window size of 100 with a step size of 10.

```
for i in `ls -1 ORFs/*fa`; do perl scripts/gc_content.pl -fasta $i [-window 100] [-step 10]; done
```
- The result will look like this : GC content & deviation for each sequences.

<p align="center">
  <img src="https://vqbgra.dm.files.1drv.com/y4m_d5SOYTiqc2q9mOTUb2ctH0ggNP206BTDIzbThQsbAvRW9_oc4LCCVe77zm2cw-WNBMz2ES5dVpdhLODeGaMRRxdsZ09HQAf6KL4Y3eHNfXkNPK6-pHODZRxKX-URuUhkRYL1h9hIdITt_WirWW-C2hFjnI0-Cw2rSgm5VoNAyWPKZdjyC1XCpxyjZxxNs30VHg2Zq_7d613p75yGsiSPw?width=553&height=168&cropmode=none" width="380" >
       <IMG SRC="https://vabgra.dm.files.1drv.com/y4mk8QwE6WwSwbhttuc5u1JsA-GvpBa3J2ikPDZChnNIvmzH9lHmY03kJ3l49PEFPmbHC4lQ_H8EKoxr6C2Kj_-V5EmutwBftNrUSDN0zNxqqHkjPW8-zo05zFMMUa8pQ1IePUjVAzlF5yzGu6SdXqUUPMkbzBnrx7yk7DRmWRYgxLISKykXUrydHeVn8qD0uOoTKhFI8oxIXCeV-GnUK0ebA?width=553&height=168&cropmode=none" width="380" >
  </p>

#### 3.3 Plot the distribution of GC content in R: using the rscript 'gc_content.r'

<p align="center">
  <img src="https://tazfoa.dm.files.1drv.com/y4ms1IS8Ux4Nj1H9DXBuaWEe44h_GpVdEgIQvC9EPRo6U80JmX2z-IpJbCKmf7lRT7pRrTExXsF4HoBOwan_Z2ZiFTxKWTUVD5fH5Zbf1EERqBAmddvC4MO_JImboTxFQ-yIo6E51TDNPlBvIkTdGM31JPS4AvX2qLVZetMXsN-LkE_1g06aa0PQr2xLIyzbSFfVjwZTVixoyoSl2hzfsle6g?width=1121&height=557&cropmode=none" width="800" title="output of ORF validation">
  </p>

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

