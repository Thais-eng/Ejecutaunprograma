#!/bin/bash

# Script para alinear secuencias y construir árbol filogenético Canidae

module load mafft
module load iqtree/2.2.6

echo "Alineando secuencias con MAFFT..."
mafft --auto ../Data/canidae_cytb_subset.fasta > aligned_cytb.fasta

echo "Construyendo árbol con IQ-TREE..."
iqtree -s aligned_cytb.fasta -m MFP -nt AUTO -bb 1000 -alrt 1000

echo "Moviendo resultados a la carpeta Results..."
mv *.treefile ../Results/canidae_tree.nwk
mv *.log ../Results/
mv *.iqtree ../Results/
mv *.ckp.gz ../Results/
mv *.bionj ../Results/
mv *.mldist ../Results/
mv *.model.gz ../Results/
mv *.contree ../Results/
mv *.splits.nex ../Results/
mv *.alrt* ../Results/
mv *.png ../Results/ 2>/dev/null  # por si existe una imagen del árbol

echo "Árbol construido y guardado en Results/"

