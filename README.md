Assemble2Docker
===============

A docker image containing an [RNA Science ToolBox](http://fjossinet.github.io/RNA-Science-Toolbox/) to be used with the tool [Assemble2](http://www.bioinformatics.org/assemble/).

Usage
-----

First you need to install Docker on your computer. You can find all the details [here](https://docs.docker.com/engine/installation/).

If you're not using Linux, your Docker images will be loaded in a Virtual Machine. You can get its IP address (your_vm_IP) by typing the command:

    docker-machine ls

Get and load the docker image containing a MongoDB database:  

    docker pull mongo:2.6
    docker run -p 27017:27017 -d mongo:2.6

Now, get our docker image:

    docker pull fjossinet/assemble2

This image is based on [continuumio/miniconda](https://github.com/ContinuumIO/docker-images/tree/master/miniconda). It contains an RNA Science Toobox with all its Python dependencies (pandas, pymongo,...) and a bunch of RNA algorithms compiled and configured (Vienna RNA package, RNAView, MLocarna,...).

Use it first to feed your MongoDB database with fragments extracted from 3D structures from the PDB:

     docker run fjossinet/assemble2 import_3Ds.py -canonical_only -annotate

If you're not using Linux, this command should be:

    docker run fjossinet/assemble2 import_3Ds.py -canonical_only -annotate -mh your_vm_IP

Do the same for the non-redundant database [RNA 3D Hub](http://rna.bgsu.edu/rna3dhub/):

    docker run fjossinet/assemble2 import_3Ds.py -rna3dhub -canonical_only -annotate

If you're not using Linux, this command should be:

    docker run fjossinet/assemble2 import_3Ds.py -rna3dhub -canonical_only -annotate -mh your_vm_IP

Once done, launch the embedded server to deploy the Web services:

    docker run -p 8080:8080 -d fjossinet/assemble2 server.py

If you're not using Linux, this command should be:

    docker run -p 8080:8080 -d fjossinet/assemble2 server.py -mh your_vm_IP

Launch [Assemble2](http://www.bioinformatics.org/assemble/). In "File -> Configure -> Assemble2", add the following Web services address: http://127.0.0.1:8080. If you're not using Linux, this address should be http://your_vm_IP:8080.
