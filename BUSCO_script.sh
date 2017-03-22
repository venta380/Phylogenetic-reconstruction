#! /bin/bash -l

#SBATCH -A b2014034
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 150:00:00
#SBATCH -J Busco_eukaryota
#SBATCH --mail-user venkat.talla@ebc.uu.se
#SBATCH --mail-type=ALL

export AUGUSTUS_CONFIG_PATH=/home/venkat/bin/augustus/augustus.2.5.5/config
PATH=$PATH:/home/venkat/bin/augustus/augustus.2.5.5/bin
module load bioinfo-tools 
module load emboss
module load hmmer
module load blast/2.2.29+



eukaryota="/home/venkat/bin/BUSCO_v1.2/eukaryota"
arthropoda="/home/venkat/bin/BUSCO_v1.2/arthropoda"

reffrence="/home/venkat/glob/BUTERFLY_GENOME_comparisions/population_samples"
output1=$reffrence/busco_eukaryotes
output2=$reffrence/busco_arthropods

#cd $output1

for i in $(ls $reffrence/*.fa)
do
out=$(echo $i | cut -f 6 -d "/" | cut -f 1 -d "-")
echo $out
echo $i
python /home/venkat/bin/BUSCO_v1.2/BUSCO_v1.2.py -f -c 8 -in $i -o $out  -l $eukaryota -m genome
done


cd $output2

for i in $(ls $reffrence/*.fa)
do
out=$(echo $i | cut -f 6 -d "/" | cut -f 1 -d "-")
echo $out
echo $i
python /home/venkat/bin/BUSCO_v1.2/BUSCO_v1.2.py -f -c 8 -in $i -o $out  -l $arthropoda -m genome
done
