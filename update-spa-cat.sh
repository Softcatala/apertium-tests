#!/bin/bash

cd /scratch/apertium-spa && git fetch --all && git clean -fd && git reset --hard origin/master && git pull && ./autogen.sh && make
cd /scratch/apertium-cat && git fetch --all && git clean -fd && git reset --hard origin/master && git pull && ./autogen.sh && make
cd /scratch/apertium-ron && git fetch --all && git clean -fd && git reset --hard origin/master && git pull && ./autogen.sh && make
cd /scratch/apertium-eng && git fetch --all && git clean -fd && git reset --hard origin/master && git pull && ./autogen.sh && make
#cd /scratch/apertium-fra && git fetch --all && git clean -fd && git reset --hard origin/master && ./autogen.sh && make
cd /scratch/apertium-spa-cat && git fetch --all && git clean -fd && git reset --hard origin/master && git pull && ./autogen.sh --with-lang1=../apertium-spa --with-lang2=../apertium-cat && make langs && make install
cd /scratch/apertium-eng-cat && git fetch --all && git clean -fd && git reset --hard origin/master && git pull && ./autogen.sh --with-lang1=../apertium-eng --with-lang2=../apertium-cat && make langs && make install
cd /scratch/apertium-ron-cat && git fetch --all && git clean -fd && git reset --hard origin/master && git pull && ./autogen.sh --with-lang1=../apertium-ron --with-lang2=../apertium-cat && make langs && make install
#cd /scratch/apertium-fra-cat && git fetch --all && git clean -fd && git reset --hard origin/master && ./autogen.sh --with-lang1=../apertium-fra --with-lang2=../apertium-cat && make langs && make install

