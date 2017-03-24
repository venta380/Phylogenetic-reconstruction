mafft --thread 4 --threadit 0 --reorder --anysymbol --auto --adjustdirection concat_final_with_pop.fa > new-Rotated.mafft

raxmlHPC-HYBRID-AVX -T 10 -s concat_with_phoebis.final -N autoMRE -n concat_conserved_final_final -f a -m PROTGAMMAGTR -# 10000 -x 12345 -p 12345 -o Manduca_sexta,Bombyx_mori 
