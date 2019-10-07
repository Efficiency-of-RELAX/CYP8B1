#Set the variable i to the value of open reading frame fasta file.

i=$1

#Run multiple MSA programs through guidance with 100 bootstraps
guidance.pl --program GUIDANCE --seqFile "$i" --msaProgram PRANK --seqType codon --outDir "$i".100_PRANK --genCode 1 --bootstraps 100 --proc_num 20
guidance.pl --program GUIDANCE --seqFile "$i" --msaProgram MUSCLE --seqType codon --outDir "$i".100_MUSCLE --genCode 1 --bootstraps 100 --proc_num 20
guidance.pl --program GUIDANCE --seqFile "$i" --msaProgram CLUSTALW --seqType codon --outDir "$i".100_CLUSTALW --genCode 1 --bootstraps 100 --proc_num 20
guidance.pl --program GUIDANCE --seqFile "$i" --msaProgram MAFFT --seqType codon --outDir "$i".100_MAFFT --genCode 1 --bootstraps 100 --proc_num 20

#sort MSA files before comparing
##Use https://github.com/shenwei356/seqkit
seqkit sort "$i".100_PRANK/MSA.PRANK.aln.With_Names >"$i"_PRANK.aln
seqkit sort "$i".100_MUSCLE/MSA.MUSCLE.aln.With_Names >"$i"_MUSCLE.aln
seqkit sort "$i".100_CLUSTALW/MSA.CLUSTALW.aln.With_Names >"$i"_CLUSTALW.aln
seqkit sort "$i".100_MAFFT/MSA.MAFFT.aln.With_Names >"$i"_MAFFT.aln

#Compare alignments to get AOS and MOS
##Use https://msa.sbc.su.se/cgi-bin/msa.cgi
echo "MUMSA comparison results of mumsa -g -s "$i"_PRANK.aln "$i"_MUSCLE.aln "$i"_CLUSTALW.aln "$i"_MAFFT.aln" > "$i".log
mumsa -g -s "$i"_PRANK.aln "$i"_MUSCLE.aln "$i"_CLUSTALW.aln "$i"_MAFFT.aln >> "$i".log
alncomp=`mumsa -g -s "$i"_PRANK.aln "$i"_MUSCLE.aln "$i"_CLUSTALW.aln "$i"_MAFFT.aln`

#Perform model testing on each alignment
##Use https://github.com/ddarriba/modeltest/releases
modeltest-ng -i "$i"_MAFFT.aln -t ml -T raxml
modeltest-ng -i "$i"_PRANK.aln -t ml -T raxml
modeltest-ng -i "$i"_MUSCLE.aln -t ml -T raxml
modeltest-ng -i "$i"_CLUSTALW.aln -t ml -T raxml

for j in "$i"_PRANK "$i"_MUSCLE "$i"_CLUSTALW "$i"_MAFFT
do
BICmodel=`grep -A 2 "Best model according to BIC" "$j".aln.out|tail -1|awk '{print $2}'`
AICmodel=`grep -A 2 "Best model according to AICc" "$j".aln.out|tail -1|awk '{print $2}'`
echo $j $BICmodel $AICmodel
done

j="$i"_PRANK
model=`grep -A 2 "Best model according to BIC" "$j".aln.out|tail -1|awk '{print $2}'`
#Using the PRANK alignment best model according to BIC
echo "Model $model has been selected." >> "$i".log

#Build phylogenies with bootstrap
##Use https://github.com/amkozlov/raxml-ng
raxml-ng --all -msa "$i"_PRANK.aln --model $model --bs-trees 1000 --threads 2

roottax=`grep ">" "$i"_PRANK.aln|head -1|sed 's/>//g'`

#reroot and sort trees before counting topologies
##Use http://cegg.unige.ch/newick_utils
nw_topology "$i"_PRANK.aln.raxml.bootstraps|nw_reroot - $roottax|nw_order -|sort|uniq -c|awk '$1>100{print $2}' > 10per_more.txt
top10per=`cat 10per_more.txt|wc -l`
echo "$top10per topologies supported by more than 10 percent of the trees." >> "$i".log

nw_topology "$i"_PRANK.aln.raxml.bootstraps|nw_reroot - $roottax|nw_order -|sort|uniq -c|awk '$1>10{print $2}' > 1per_more.txt
top1per=`cat 1per_more.txt|wc -l`
echo "$top1per topologies supported by more than 1 percent of the trees." >> "$i".log

taxcount=`grep ">" "$i"_PRANK.aln|wc -l`
#create a file with list of all species that are part of the alignment
grep ">" "$i"_PRANK.aln|sed 's/>//g' > taxlist.txt

echo -ne "$i\t$alncomp\t$model\t$roottax\t$top10per\t$top1per\n" >> ../all.stats

