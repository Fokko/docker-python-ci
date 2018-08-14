FROM python:3.7

# Install the apt-get stuff
RUN apt update && \
    apt install -y protobuf-compiler python-pil python-lxml python-tk && \
    apt clean

# Install the python dependencies
RUN pip install tensorflow Cython contextlib2 jupyter matplotlib lxml pillow

# Install the cocoapi stuff
RUN git clone https://github.com/cocodataset/cocoapi.git ~/cocoapi && \
    cd ~/cocoapi/PythonAPI && \
    make

# Set the python path for the cocoapi stuff
ENV PYTHONPATH=$PYTHONPATH:/root/cocoapi/PythonAPI/pycocotools
