#!/bin/bash

cp /scratch/corpus/translations-new/testvoc.* /scratch/corpus/translations-old/

#cd /scratch/apertium-spa-cat

#dev/generation.sh spa-cat | grep -v '<prn><enc>' > /scratch/corpus/translations-new/testvoc.spa-cat.txt
#dev/generation.sh spa-cat_valencia | grep -v '<prn><enc>' > /scratch/corpus/translations-new/testvoc.spa-cat_valencia.txt
#dev/generation.sh cat-spa > /scratch/corpus/translations-new/testvoc.cat-spa.txt

echo "start spa-cat"
date

cd /scratch/apertium-spa-cat/dev/testvoc

./testvoc.sh -q
cat /scratch/apertium-spa-cat/dev/testvoc/testvoc-errors.spa-cat.txt > /scratch/corpus/translations-new/testvoc.spa-cat.txt
cat /scratch/apertium-spa-cat/dev/testvoc/testvoc-errors.spa-cat_valencia.txt > /scratch/corpus/translations-new/testvoc.spa-cat_valencia.txt
cat /scratch/apertium-spa-cat/dev/testvoc/testvoc-errors.spa-cat_valencia_uni.txt > /scratch/corpus/translations-new/testvoc.spa-cat_valencia_uni.txt
cat /scratch/apertium-spa-cat/dev/testvoc/testvoc-errors.cat-spa.txt > /scratch/corpus/translations-new/testvoc.cat-spa.txt

echo "start ron-cat"
date

cd /scratch/apertium-ron-cat/dev/testvoc

./testvoc.sh -q
cat /scratch/apertium-ron-cat/dev/testvoc/testvoc-errors.ron-cat.txt > /scratch/corpus/translations-new/testvoc.ron-cat.txt
cat /scratch/apertium-ron-cat/dev/testvoc/testvoc-errors.cat-ron.txt > /scratch/corpus/translations-new/testvoc.cat-ron.txt

echo "start eng-cat"
date

cd /scratch/apertium-eng-cat/dev/testvoc

./testvoc.sh -q
cat /scratch/apertium-eng-cat/dev/testvoc/testvoc-errors.eng-cat.txt > /scratch/corpus/translations-new/testvoc.eng-cat.txt
cat /scratch/apertium-eng-cat/dev/testvoc/testvoc-errors.eng-cat_valencia.txt > /scratch/corpus/translations-new/testvoc.eng-cat_valencia.txt
cat /scratch/apertium-eng-cat/dev/testvoc/testvoc-errors.eng-cat_valencia_uni.txt > /scratch/corpus/translations-new/testvoc.eng-cat_valencia_uni.txt
cat /scratch/apertium-eng-cat/dev/testvoc/testvoc-errors.cat-eng.txt > /scratch/corpus/translations-new/testvoc.cat-eng.txt
cat /scratch/apertium-eng-cat/dev/testvoc/testvoc-errors.cat-eng_US.txt > /scratch/corpus/translations-new/testvoc.cat-eng_US.txt

echo "end eng-cat"
date
