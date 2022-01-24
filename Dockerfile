FROM mongo:latest
ADD runfile.sh /
ADD clean.py /
ADD copy-ml.py /
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install pandas
ENTRYPOINT ["/bin/bash", "/runfile.sh"]

