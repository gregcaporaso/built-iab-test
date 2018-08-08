# Distributed under the terms of the Modified BSD License.


FROM jupyter/base-notebook

LABEL maintainer="Greg Caporaso <gregcaporaso@gmail.com>"

USER root

# This dockerfile is derived from the following, which solved the problem of 
# using ete3 with Binder.
# https://github.com/mossmatters/MJPythonNotebooks/blob/master/Dockerfile

RUN apt-get update
RUN apt-get install -y xvfb

RUN Xvfb :1 -screen 0 1600x1200x16 &
RUN export DISPLAY=:99.0

USER main
 
RUN pip install ete3
RUN pip install https://github.com/caporaso-lab/An-Introduction-To-Applied-Bioinformatics/archive/master.zip