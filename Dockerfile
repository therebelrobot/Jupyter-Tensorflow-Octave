FROM jupyter/tensorflow-notebook:36d857bb0121

ENV JUPYTER_ENABLE_LAB=yes
ENV RESTARTABLE=yes
ENV PORT=8888
ENV GRANT_SUDO=yes

VOLUME /home/jovyan/

USER root
RUN export DEBIAN_FRONTEND=noninteractive && sudo DEBIAN_FRONTEND=noninteractive apt-get -yq update && sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq octave

USER jovyan
RUN pip install lxml octave_kernel
RUN jupyter notebook --generate-config -y
RUN echo 'c.NotebookApp.token = ""' >> /home/jovyan/.jupyter/jupyter_notebook_config.py
EXPOSE 8888
