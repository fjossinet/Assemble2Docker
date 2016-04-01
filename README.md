Assemble2Docker
===============

A docker image containing the RNA algorithms needed by Assemble2

Usage
-----

    docker run -v /Users/fjossinet/your_files_dir/:/data fjossinet/Assemble2Docker your_command

Examples
--------

    docker run -v /Users/fjossinet/samples/:/data fjossinet/Assemble2Docker foldalign /data/test.fasta
    docker run -v /Users/fjossinet/samples/:/data fjossinet/Assemble2Docker bash -c 'RNAfold < /data/test.fasta'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/Assemble2Docker bash -c 'RNAfold < /data/test.fasta'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/Assemble2Docker bash -c 'RNAsubopt -e 1 < /data/test.fasta'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/Assemble2Docker bash -c 'RNAplot -o svg < /data/test.vienna ; more *.svg'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/Assemble2Docker rnaview -p /data/test.pdb
    docker run -v /Users/fjossinet/samples/:/data fjossinet/Assemble2Docker foldalign -p /data/test.fasta
