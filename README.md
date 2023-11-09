# rwkv-pth-to-bin-converter

Docker file to convert RWKV models from .pth to (optionally quantized) .bin format

[RWKV](https://www.rwkv.com/) is an approach for "large language models" (LLMs) which differs from the more common "generative pre-trained transformers" (GPT). It claims to have several advantages, such as "_great performance, fast inference, fast training, saves VRAM, "infinite" ctxlen, and free text embedding. Moreover it's 100% attention-free._"

[rwkv.cpp](https://github.com/saharNooby/rwkv.cpp) is a port of (BlinkDL/RWKV-LM)[https://github.com/BlinkDL/RWKV-LM] which offers a C library that is the base for bindings for other languages, such as [llama-node](https://github.com/Atome-FE/llama-node) which offers a JavaScript API within Node.js

rwkv.cpp needs RWKV models in the .bin format while [Hugging Face](https://huggingface.co/BlinkDL) normally offers them in .pth format only.




> **Nota bene** rwkv.cpp is currently not compatible with RWKV-5 models - please use RWKV-4 models only for the moment

## License ##

[MIT License](LICENSE.md)
