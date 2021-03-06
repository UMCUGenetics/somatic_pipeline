#! /bin/bash
# 
# Simple annotator loop for .vcf and .snp files
#
#   ~/opt/somatic_pipeline/scripts/annotate.sh < list
#
# e.g.,
#
#   ls *Somatic*vcf --color=never -1 |~/opt/somatic_pipeline/scripts/annotate.sh
#

# annotate=/data/common_scripts/SAP42-testing/annotator.pl
annotate=/hpc/cog_bioinf/common_scripts/SAP42-HPC/annotator.pl
onceonly="once-only"

while read infile ; do
  echo ==== $annotate $infile...
  # echo "$annotate -in $infile"|$onceonly -in $infile --out $infile.snv1 --out $infile.snv2 --pfff -d . -v
  echo "$annotate -in $infile"|$onceonly -in $infile --out $infile.snv1 --out $infile.snv2 --pbs '-q medium' --pbs-type SGE --pfff -d . -v
  [ $? -ne 0 ] && exit 1
done
