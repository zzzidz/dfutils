mkdir /workspace
cd /workspace

apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
wget http://launchpadlibrarian.net/367274644/libgoogle-perftools-dev_2.5-2.2ubuntu3_amd64.deb
wget https://launchpad.net/ubuntu/+source/google-perftools/2.5-2.2ubuntu3/+build/14795286/+files/google-perftools_2.5-2.2ubuntu3_all.deb
wget https://launchpad.net/ubuntu/+source/google-perftools/2.5-2.2ubuntu3/+build/14795286/+files/libtcmalloc-minimal4_2.5-2.2ubuntu3_amd64.deb
wget https://launchpad.net/ubuntu/+source/google-perftools/2.5-2.2ubuntu3/+build/14795286/+files/libgoogle-perftools4_2.5-2.2ubuntu3_amd64.deb
apt install -qq libunwind8-dev -y
dpkg -i *.deb
env LD_PRELOAD=libtcmalloc.so
rm *.deb

pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U
apt -y install -qq aria2 -y
pip install -q xformers==0.0.16
pip install -q triton==2.0.0

git clone -b v2.0 https://github.com/camenduru/stable-diffusion-webui
git clone https://huggingface.co/embed/negative /workspace/stable-diffusion-webui/embeddings/negative
git clone https://huggingface.co/embed/lora /workspace/stable-diffusion-webui/models/Lora/positive
wget https://raw.githubuserworkspace.com/camenduru/stable-diffusion-webui-scripts/main/run_n_times.py -O /workspace/stable-diffusion-webui/scripts/run_n_times.py
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser /workspace/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git clone -b v2.0 https://github.com/camenduru/sd-civitai-browser /workspace/stable-diffusion-webui/extensions/sd-civitai-browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks /workspace/stable-diffusion-webui/extensions/sd-webui-additional-networks
git clone https://github.com/Mikubill/sd-webui-controlnet /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet
git clone https://github.com/camenduru/openpose-editor /workspace/stable-diffusion-webui/extensions/openpose-editor
git clone https://github.com/jexom/sd-webui-depth-lib /workspace/stable-diffusion-webui/extensions/sd-webui-depth-lib
git clone https://github.com/camenduru/sd-webui-tunnels /workspace/stable-diffusion-webui/extensions/sd-webui-tunnels
git clone https://github.com/etherealxx/batchlinks-webui /workspace/stable-diffusion-webui/extensions/batchlinks-webui
git clone https://github.com/camenduru/stable-diffusion-webui-catppuccin /workspace/stable-diffusion-webui/extensions/stable-diffusion-webui-catppuccin
git clone https://github.com/KohakuBlueleaf/a1111-sd-webui-locon /workspace/stable-diffusion-webui/extensions/a1111-sd-webui-locon
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg /workspace/stable-diffusion-webui/extensions/stable-diffusion-webui-rembg
git clone https://github.com/ashen-sensored/stable-diffusion-webui-two-shot /workspace/stable-diffusion-webui/extensions/stable-diffusion-webui-two-shot
cd /workspace/stable-diffusion-webui
git reset --hard

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_canny-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_canny-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_normal-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_normal-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_openpose-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_openpose-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_seg-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_seg-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_openpose_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_openpose_sd14v1.pth --check-certificate=falsaria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_keypose_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_keypose_sd14v1.pth --check-certificate=false

# round glass lora
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/zzztuizz/blinh/resolve/main/output/blinh-000012.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-additional-networks/models/lora -o blinh.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/25337?type=Model&format=SafeTensor" -d /workspace/stable-diffusion-webui/extensions/sd-webui-additional-networks/models/lora -o roundglasses.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://huggingface.co/Linaqruf/stolen/resolve/main/pruned-models/chillout_mix-pruned.safetensors" -d /workspace/stable-diffusion-webui/models/Stable-diffusion -o clm.safetensors --check-certificate=false
sed -i -e '''/    prepare_environment()/a\    os.system\(f\"""sed -i -e ''\"s/dict()))/dict())).cuda()/g\"'' /workspace/stable-diffusion-webui/repositories/stable-diffusion-stability-ai/ldm/util.py""")''' /workspace/stable-diffusion-webui/launch.py
sed -i -e 's/fastapi==0.90.1/fastapi==0.89.1/g' /workspace/stable-diffusion-webui/requirements_versions.txt

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt -d /workspace/stable-diffusion-webui/ -o newVae.vae.pth --check-certificate=false

mkdir /workspace/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui/models

python launch.py --listen --xformers --enable-insecure-extension-access --theme dark --gradio-queue --multiple --vae-path newVae.vae.pth
