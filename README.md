Assemble2Docker
===============

A docker image containing the RNA algorithms needed by Assemble2

Usage
-----

First you need to install Docker on your computer. You can find all the details [here](https://docs.docker.com/engine/installation/).

Once done, to get the image, you just need to type:

    docker pull fjossinet/assemble2

To use the image, type:

    docker run -v /Users/fjossinet/your_files_dir/:/data fjossinet/assemble2 your_command

Examples of usage:
-------------------

    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2 bash -c 'RNAfold < /data/test.fasta'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2 bash -c 'RNAsubopt -e 2 < /data/test.fasta'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2 bash -c 'RNAplot -o svg < /data/test.vienna ; more *.svg'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2 foldalign /data/test.fasta
    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2 rnaview -p /data/test.pdb
    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2 mlocarna /data/test.fasta
