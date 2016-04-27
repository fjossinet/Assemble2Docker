Assemble2Docker
===============

A docker image containing an [RNA Science ToolBox](http://fjossinet.github.io/RNA-Science-Toolbox/) to be used with the tool [Assemble2](http://www.bioinformatics.org/assemble/).

Installation and Configuration
------------------------------

First you need to install Docker on your computer. You can find all the details [here](https://docs.docker.com/engine/installation/).

If you're not using Linux, your Docker images will be loaded in a Virtual Machine. You can get its IP address (your_vm_IP) by typing the command:

    docker-machine ls

Get and load the docker image containing a MongoDB database:  

    docker pull mongo:2.6
    docker run -p 27017:27017 -d mongo:2.6

Once this first docker container launched, type:

    docker ps

This should produce an output like:

    CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS              PORTS                           NAMES
    19e90d22e093        mongo:2.6             "/entrypoint.sh mongo"   28 seconds ago      Up 28 seconds       YOUR_IP_ADRESS:27017->27017/tcp   trusting_goldberg

Write down YOUR_IP_ADRESS from this output. You will need it later.

Now, get our docker image:

    docker pull fjossinet/assemble2

This image is based on [continuumio/miniconda](https://github.com/ContinuumIO/docker-images/tree/master/miniconda). It contains an RNA Science Toobox with all its Python dependencies (pandas, pymongo,...) and a bunch of RNA algorithms compiled and configured (Vienna RNA package, RNAView, MLocarna,...).

Usage
-----

This Docker container allows you to use the RNA algorithms directly or to deploy them as Web services to be consumed from other tools like Assemble2.

### Use RNA algorithms

For example, to use the mlocarna algorithm, you should type something like:

     docker run -v /Users/fjossinet/my_files/:/data fjossinet/assemble2 mlocarna /data/my_sequences.fasta

### Deploy the RNA algorithms as Web services

Use it first to feed your MongoDB database with fragments extracted from 3D structures from the PDB:

     docker run fjossinet/assemble2 import_3Ds.py -canonical_only -annotate -mh YOUR_IP_ADRESS

Do the same for the non-redundant database [RNA 3D Hub](http://rna.bgsu.edu/rna3dhub/):

    docker run fjossinet/assemble2 import_3Ds.py -rna3dhub -canonical_only -annotate -mh YOUR_IP_ADRESS

Once done, launch the embedded server to deploy the Web services:

    docker run -p 8080:8080 -d fjossinet/assemble2 server.py -mh YOUR_IP_ADRESS

Launch [Assemble2](http://www.bioinformatics.org/assemble/). In "File -> Configure -> Assemble2", add the following Web services address: http://YOUR_IP_ADRESS:8080.
