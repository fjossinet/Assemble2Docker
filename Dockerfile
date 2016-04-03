FROM continuumio/miniconda
MAINTAINER Fabrice Jossinet (fjossinet@gmail.com)
RUN apt-get update && apt-get install -y git wget build-essential

#rnaview
RUN wget -qO RNAVIEW.tar.gz "https://dl.dropboxusercontent.com/u/3753967/algorithms/RNAVIEW.tar.gz" && tar -xzvf RNAVIEW.tar.gz
WORKDIR RNAVIEW/
RUN make && make clean
ENV RNAVIEW /RNAVIEW

#Vienna RNA package
WORKDIR /
RUN wget -qO ViennaRNA-2.1.8.tar.gz "http://dl.dropbox.com/u/3753967/algorithms/ViennaRNA-2.1.8.tar.gz" && tar -xzvf ViennaRNA-2.1.8.tar.gz
WORKDIR ViennaRNA-2.1.8/
RUN ./configure
RUN make && make install && make clean

#foldalign
WORKDIR /
RUN wget -qO foldalign.2.1.1.tar.gz "http://dl.dropbox.com/u/3753967/algorithms/foldalign.2.1.1.tar.gz" && tar -xzvf foldalign.2.1.1.tar.gz
WORKDIR foldalign.2.1.1
RUN make

#locarna
WORKDIR /
RUN wget -qO locarna-1.8.1.tar "http://dl.dropbox.com/u/3753967/algorithms/locarna-1.8.1.tar" && tar -xvf locarna-1.8.1.tar
WORKDIR locarna-1.8.1/
RUN ./configure --with-vrna=/usr/local/ --without-perl --without-forester --without-kinfold
RUN make && make install && make clean
ENV LD_LIBRARY_PATH /usr/local/lib

WORKDIR /

RUN conda config --set always_yes TRUE && conda install pandas pymongo ujson tornado
RUN git clone https://github.com/JossinetLab/RNA-Science-Toolbox.git

ENV PYTHONPATH $PYTHONPATH:/RNA-Science-Toolbox
ENV PATH /RNAVIEW/bin:/foldalign.2.1.1/bin:/RNA-Science-Toolbox/pyrna/:/RNA-Science-Toolbox/files/scripts/python/:$PATH

EXPOSE 8080
