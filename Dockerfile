FROM python:3.9.18-slim-bookworm

RUN apt update \
 && apt-get update \
 && apt-get install install build-essential git cmake -y \
 && git clone --recursive https://github.com/saharNooby/rwkv.cpp.git \
 && cd rwkv.cpp \
 && cmake . \
 && cmake --build . --config Release \
 && pip install --upgrade pip \
 && pip install torch numpy \
 && python python/convert_pytorch_to_ggml.py /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096.pth /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096.bin FP16 \
 && python python/quantize.py /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096.bin /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096-Q4_0.bin Q4_0 \
 && python python/quantize.py /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096.bin /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096-Q4_1.bin Q4_1 \
 && python python/quantize.py /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096.bin /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096-Q5_0.bin Q5_0 \
 && python python/quantize.py /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096.bin /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096-Q5_1.bin Q5_1 \
 && python python/quantize.py /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096.bin /rwkv/RWKV-5-World-1B5-v2-20231025-ctx4096-Q8_0.bin Q8_0 \
 && python python/convert_pytorch_to_ggml.py /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096.pth /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096.bin FP16 \
 && python python/quantize.py /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096.bin /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096-Q4_0.bin Q4_0 \
 && python python/quantize.py /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096.bin /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096-Q4_1.bin Q4_1 \
 && python python/quantize.py /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096.bin /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096-Q5_0.bin Q5_0 \
 && python python/quantize.py /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096.bin /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096-Q5_1.bin Q5_1 \
 && python python/quantize.py /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096.bin /rwkv/RWKV-5-World-0.1B-v1-20230803-ctx4096-Q8_0.bin Q8_0
