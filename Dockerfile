
FROM ros:melodic

RUN useradd -m gazebos
#NEED TO RUN AS ROOT
USER root
RUN echo $HOME

WORKDIR = $HOME

COPY $HOME /home/gcullen/Downloads/vexField.dae

RUN apt-get update

RUN apt-get install curl

#install gazebo
RUN curl -sSL http://get.gazebosim.org | sh

RUN cd $HOME

RUN mkdir -p models/vexField/meshes

RUN cd models/vexField

RUN git clone https://github.com/BraedenCullenCodes/VEXgazeboField.git

COPY $HOME/models/vexField/meshes /home/gcullen/Desktop/full-field.mtl

COPY $HOME/models/vexField/meshes /home/gcullen/Desktop/full-field.obj

RUN gazebo --verbose