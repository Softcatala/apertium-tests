#!/bin/bash
apertium_dir=/scratch/apertium-spa-cat
corpus_dir=/scratch/corpus

for file in ${corpus_dir}/spa-*
do
    file_bn=${file##*/}
    file_bn=${file_bn%.*}
    echo "Translating $file_bn from $file..."

    cp ${corpus_dir}/translations-new/${file_bn}-cat.new ${corpus_dir}/translations-old/${file_bn}-cat.old
    cat $file | apertium -d $apertium_dir spa-cat > ${corpus_dir}/translations-new/${file_bn}-cat.new

    cp ${corpus_dir}/translations-new/${file_bn}-cat_valencia.new ${corpus_dir}/translations-old/${file_bn}-cat_valencia.old
    cat $file | apertium -d $apertium_dir spa-cat_valencia > ${corpus_dir}/translations-new/${file_bn}-cat_valencia.new
done


for file in ${corpus_dir}/cat-*
do
    file_bn=${file##*/}
    file_bn=${file_bn%.*}
    echo "Translating $file_bn from $file..."

    for lang in spa eng ron
    do
	cp ${corpus_dir}/translations-new/${file_bn}-${lang}.new ${corpus_dir}/translations-old/${file_bn}-${lang}.old
	cat $file | apertium -d /scratch/apertium-${lang}-cat cat-${lang} > ${corpus_dir}/translations-new/${file_bn}-${lang}.new
    done
done

/scratch/scripts/differences.sh

