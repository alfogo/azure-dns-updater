FROM python:3.14.0a1-slim
ADD azure-dns-updater.py /
RUN pip install --upgrade pip
RUN pip install azure-common
RUN pip install azure-mgmt-dns
RUN pip install msrestazure
RUN pip install azure-identity
CMD [ "python", "./azure-dns-updater.py" ]