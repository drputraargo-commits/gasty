# Gunakan image PyTorch dari AWS
FROM 763104351884.dkr.ecr.us-east-1.amazonaws.com/pytorch-inference:2.1.0-cpu-py310-ubuntu20.04

# Install awscli
RUN pip install awscli

# Copy kode ke container
COPY inference.py /opt/ml/model/code/inference.py
COPY setup.sh /opt/ml/model/code/setup.sh

# Set permission buat script
RUN chmod +x /opt/ml/model/code/setup.sh

# Set entrypoint (opsional, tapi bagus buat debug)
ENTRYPOINT ["python", "/opt/ml/model/code/inference.py"]
