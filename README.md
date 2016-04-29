Assemble2Docker
===============

A docker image containing the following algorithms fully configured:

* [RNAVIEW](http://ndbserver.rutgers.edu/ndbmodule/services/download/rnaview.html)
* [Vienna RNA package](https://www.tbi.univie.ac.at/RNA/)
* [foldalign](http://rth.dk/resources/foldalign/)
* [LocARNA](http://rna.informatik.uni-freiburg.de/LocARNA/)

Installation
------------

First you need to install Docker on your computer. You can find all the details [here](https://docs.docker.com/engine/installation/).

Then, to get our docker image, you need to type:

    docker pull fjossinet/assemble2

Usages and Examples
-------------------

In general, these algorithms need input files. Consequently, you have to mount the file system of your computer (the host) in the Docker container (the guest). This is done with the -v option.

LocARNA algorithm:

     docker run -v /Users/fjossinet/my_files/:/data fjossinet/assemble2 mlocarna /data/my_sequences.fasta

RNAVIEW algorithm:

    docker run -v /Users/fjossinet/my_files/:/data fjossinet/assemble2 rnaview -p /data/my_3D.pdb

RNAFold algorithm:

    docker run -v /Users/fjossinet/my_files/:/data fjossinet/assemble2 bash -c 'RNAfold < /data/my_sequence.fasta'"
