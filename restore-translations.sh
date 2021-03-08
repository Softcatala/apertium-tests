#!/bin/bash
corpus_dir=/scratch/corpus

for file in ${corpus_dir}/translations-old/*.old
do
    file_bn=${file##*/}
    file_bn=${file_bn%.*}
    echo "Reverting translations $file_bn, $file..."

    cp ${corpus_dir}/translations-old/${file_bn}.old ${corpus_dir}/translations-new/${file_bn}.new
done
