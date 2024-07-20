# Use a base image that supports ARMv7 architecture
FROM --platform=linux/arm/v7 python:3

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Add the Python script
ADD azure-dns-updater.py /

# Upgrade pip and install necessary Python packages
RUN pip install --upgrade pip && \
    pip install azure-common && \
    pip install azure-mgmt-dns && \
    pip install msrestazure && \
    pip install azure-identity

# Set the entry point
CMD [ "python", "./azure-dns-updater.py" ]

