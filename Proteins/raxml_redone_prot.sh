#! /bin/bash -l

#SBATCH -A b2014034
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 100:00:00
#SBATCH -J BUSCO_tree
#SBATCH -o BUSCO_TREE.out
#SBATCH -e BUSCO_TREE.error
#SBATCH --mail-user venkat.talla@ebc.uu.se
#SBATCH --mail-type=ALL


module load bioinfo-tools MAFFT/7.245
module load bioinfo-tools raxml/8.2.4-gcc-mpi


#raxmlHPC-HYBRID-AVX -T 16 -s concatinate_genes.fasta -m PROTGAMMAGTR -p 12345 -x 12345 -o Manduca_sexta,Bombyx_mori -n concatinate_genes_2 -# 10000
raxmlHPC-HYBRID-AVX -T 16 -s concatinate_genes.fasta -m PROTGAMMAGTR -p 12345 -x 12345 -o Manduca_sexta,Bombyx_mori -f a -n concatinate_genes_2 -# 10000 


raxmlHPC -m PROTGAMMAWAG -T 16 -p 12345 -f b -t RAxML_bestTree.concatinate_genes_2 -z RAxML_bootstrap.concatinate_genes_2 -n T15


