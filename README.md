Assemble2Docker
===============

A docker image containing the RNA algorithms needed by Assemble2

Usage
-----

    docker run -v /Users/fjossinet/your_files_dir/:/data fjossinet/assemble2docker your_command

Examples
--------

    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2docker foldalign /data/test.fasta
    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2docker bash -c 'RNAfold < /data/test.fasta'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2docker bash -c 'RNAsubopt -e 2 < /data/test.fasta'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2docker bash -c 'RNAplot -o svg < /data/test.vienna ; more *.svg'
    docker run -v /Users/fjossinet/samples/:/data fjossinet/assemble2docker rnaview -p /data/test.pdb
