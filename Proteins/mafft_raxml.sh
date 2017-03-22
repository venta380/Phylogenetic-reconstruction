mafft --thread 4 --threadit 0 --reorder --anysymbol --auto --adjustdirection concat_final_with_pop.fa > new-Rotated.mafft

raxmlHPC-HYBRID-AVX -T 4 -s new-Rotated.mafft -N autoMRE -n new-Rotated -f a -m GTRPROTGAMA -N 100 -x 12345 -p 12345 -o Manduca_sexta,Bombyx_mori

