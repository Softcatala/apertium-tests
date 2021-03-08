#!/bin/bash
corpus_dir=/scratch/corpus

missatge="Resultats dels tests \n\n"
date=`date +%Y%m%d`

for file in ${corpus_dir}/translations-new/*.new
do
    file_bn=${file##*/}
    file_bn=${file_bn%.*}

    echo "Creating diff: $file_bn ..."

    diff -U 1 ${corpus_dir}/translations-old/${file_bn}.old ${corpus_dir}/translations-new/${file_bn}.new | wdiff -d -w $'<span style="color:red">' -x $'</span>' -y $'<span style="color:green">' -z $'</span>' > ${corpus_dir}/differences/${file_bn}.diff

    rm -rf ${corpus_dir}/differences/${file_bn}.html
    diffSize=$(wc -c <"${corpus_dir}/differences/${file_bn}.diff")
    if [ $diffSize -lt 10 ]; then
        missatge+="$file_bn ($diffSize): No hi ha diferències. \n"
    elif [ $diffSize -gt 10000000 ]; then
        missatge+="$file_bn ($diffSize): Diferències massa grans. No es mostren.\n"
    else
        perl /scratch/scripts/tohtml.pl < ${corpus_dir}/differences/${file_bn}.diff > ${corpus_dir}/differences/${file_bn}.html
	missatge+="$file_bn ($diffSize): https://www.softcatala.org/apertium/dev/$date/${file_bn}.html\n"
    fi
done

missatge+="\n"

for file in ${corpus_dir}/translations-new/testvoc.*
do
    file_bn=${file##*/}
    file_bn=${file_bn%.*}
    echo "Creating diff: $file_bn ..."

    diff -U 1 ${corpus_dir}/translations-old/${file_bn}.txt ${corpus_dir}/translations-new/${file_bn}.txt > ${corpus_dir}/differences/${file_bn}.diff.txt

    diffSize=$(wc -c <"${corpus_dir}/differences/${file_bn}.diff.txt")
    if [ $diffSize -lt 10 ]; then
        missatge+="$file_bn ($diffSize): No hi ha diferències. \n"
    elif [ $diffSize -gt 10000000 ]; then
        missatge+="$file_bn ($diffSize): Diferències massa grans. No es mostren.\n"
    else
        missatge+="$file_bn ($diffSize): https://www.softcatala.org/apertium/dev/$date/${file_bn}.diff.txt\n"
    fi
done

missatge+="\n"

for file in ${corpus_dir}/translations-new/testvoc.*
do
    file_bn=${file##*/}
    file_bn=${file_bn%.*}
    echo "Copying testvoc: $file_bn ..."

    cat ${corpus_dir}/translations-new/${file_bn}.txt > ${corpus_dir}/differences/${file_bn}.txt

    diffSize=$(wc -c <"${corpus_dir}/differences/${file_bn}.txt")
    if [ $diffSize -lt 1 ]; then
        missatge+="$file_bn ($diffSize): No hi ha errors de testvoc. \n"
    else
        missatge+="$file_bn ($diffSize): https://www.softcatala.org/apertium/dev/$date/${file_bn}.txt\n"
    fi
done


mkdir ${corpus_dir}/differences/$date

cp ${corpus_dir}/differences/*.html ${corpus_dir}/differences/$date
cp ${corpus_dir}/differences/*.txt ${corpus_dir}/differences/$date

echo -e $missatge > ${corpus_dir}/differences/missatge.txt

echo -e $missatge | mail -s "Tests Apertium Softcatalà" apertium@softcatala.org


