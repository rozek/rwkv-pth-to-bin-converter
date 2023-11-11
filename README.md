# rwkv-pth-to-bin-converter

Docker file to convert RWKV models from .pth to (optionally quantized) .bin format

[RWKV](https://www.rwkv.com/) is an approach for "large language models" (LLMs) which differs from the more common "generative pre-trained transformers" (GPT). It claims to have several advantages, such as "_great performance, fast inference, fast training, saves VRAM, "infinite" ctxlen, and free text embedding. Moreover it's 100% attention-free._"

[rwkv.cpp](https://github.com/saharNooby/rwkv.cpp) is a port of [BlinkDL/RWKV-LM](https://github.com/BlinkDL/RWKV-LM) which offers a C library that is the base for bindings for other languages, such as [llama-node](https://github.com/Atome-FE/llama-node) which implements a JavaScript API for Node.js.

rwkv.cpp needs RWKV models in the .bin format while [Hugging Face](https://huggingface.co/BlinkDL) normally offers them in .pth format only. It therefore contains a Python script which performs this conversion - and another one, that can be used to quantise the model in order to reduce the resources required for inferencing.

If you do not want to install and maintain Python on your machine (which can be tricky as many AI-related Python scripts require very specific versions of Python and/or Python libraries - it's not always a good idea to just install the latest ones...), you may instead run the conversion within a [Docker](https://www.docker.com/) container.

This is where this repository comes in: it provides a Dockerfile which can be used to create an image and run a container that downloads a given RWKV model and converts and quantizes it to be used with rwkv.cpp

**Warning: llama-node is currently not able to run RWKV models (as mentioned in llama-node issue [121](https://github.com/Atome-FE/llama-node/issues/121) and rwkv.cpp issue [144](https://github.com/saharNooby/rwkv.cpp/issues/144)) - this repository therefore exists for documentation purposes only (until llama-node has been fixed)**

> **Nota bene:** depending on your host operatins system, you may have to stop the command sequence from the Dockerfile after running `cmake` for the first time and modify its output in order for the actual compilation to run without errors.
>
> Additionally, you may want to edit the Dockerfile and change the model and/or quantizations it calculates


t.b.c.



> **Nota bene:** rwkv.cpp is currently not compatible with RWKV-5 models - please use RWKV-4 models only for the moment

## License ##

[MIT License](LICENSE.md)
