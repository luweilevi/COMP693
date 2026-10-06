FROM python:3.13-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements files  into the container
COPY requirements.txt .

# Set environment variables to limit the number of threads used by OpenBLAS, OpenMP, and MKL to 1
ENV OPENBLAS_NUM_THREADS=1 \
    OMP_NUM_THREADS=1 \
    MKL_NUM_THREADS=1

# Install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir  \
    --progress-bar off \
    -r requirements.txt

COPY . .

CMD ["python", "run.py"]