FROM tensorflow/tensorflow

# Install some basic apt packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -qy \
    sudo vim nano git curl wget mc less \
    openssh-server \
    ffmpeg libsm6 libxext6 enchant  && \
    apt-get clean -qq && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN pip install tqdm dotmap matplotlib opencv-python pandas numpy jupyter sklearn tensorboard pudb pyenchant openpyxl tabulate opencv-python pip scikit-image

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
