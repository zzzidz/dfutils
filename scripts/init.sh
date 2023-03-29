cd /workspace

apt -y install -qq aria2 -y

git clone https://huggingface.co/embed/negative /workspace/stable-diffusion-webui/embeddings/negative
git clone https://huggingface.co/embed/lora /workspace/stable-diffusion-webui/models/Lora/positive
wget https://raw.githubuserworkspace.com/camenduru/stable-diffusion-webui-scripts/main/run_n_times.py -O /workspace/stable-diffusion-webui/scripts/run_n_times.py
git clone https://github.com/deforum-art/deforum-for-automatic1111-webui /workspace/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser /workspace/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git clone https://github.com/camenduru/stable-diffusion-webui-huggingface /workspace/stable-diffusion-webui/extensions/stable-diffusion-webui-huggingface
git clone -b v2.0 https://github.com/camenduru/sd-civitai-browser /workspace/stable-diffusion-webui/extensions/sd-civitai-browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks /workspace/stable-diffusion-webui/extensions/sd-webui-additional-networks
git clone https://github.com/Mikubill/sd-webui-controlnet /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet
git clone https://github.com/camenduru/openpose-editor /workspace/stable-diffusion-webui/extensions/openpose-editor
git clone https://github.com/jexom/sd-webui-depth-lib /workspace/stable-diffusion-webui/extensions/sd-webui-depth-lib
git clone https://github.com/hnmr293/posex /workspace/stable-diffusion-webui/extensions/posex
git clone https://github.com/camenduru/sd-webui-tunnels /workspace/stable-diffusion-webui/extensions/sd-webui-tunnels
git clone https://github.com/etherealxx/batchlinks-webui /workspace/stable-diffusion-webui/extensions/batchlinks-webui
git clone https://github.com/camenduru/stable-diffusion-webui-catppuccin /workspace/stable-diffusion-webui/extensions/stable-diffusion-webui-catppuccin
git clone https://github.com/KohakuBlueleaf/a1111-sd-webui-locon /workspace/stable-diffusion-webui/extensions/a1111-sd-webui-locon
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg /workspace/stable-diffusion-webui/extensions/stable-diffusion-webui-rembg
git clone https://github.com/ashen-sensored/stable-diffusion-webui-two-shot /workspace/stable-diffusion-webui/extensions/stable-diffusion-webui-two-shot
cd /workspace/stable-diffusion-webui
git reset --hard

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_canny-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_canny-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_depth-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_depth-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_hed-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_hed-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_mlsd-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_mlsd-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_normal-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_normal-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_openpose-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_openpose-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_scribble-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_scribble-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/control_seg-fp16.safetensors -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_seg-fp16.safetensors --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/hand_pose_model.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/annotator/openpose -o hand_pose_model.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/body_pose_model.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/annotator/openpose -o body_pose_model.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/dpt_hybrid-midas-501f0c75.pt -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/annotator/midas -o dpt_hybrid-midas-501f0c75.pt --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/mlsd_large_512_fp32.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/annotator/mlsd -o mlsd_large_512_fp32.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/mlsd_tiny_512_fp32.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/annotator/mlsd -o mlsd_tiny_512_fp32.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/network-bsds500.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/annotator/hed -o network-bsds500.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/upernet_global_small.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/annotator/uniformer -o upernet_global_small.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_style_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_style_sd14v1.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_sketch_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_sketch_sd14v1.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_seg_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_seg_sd14v1.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_openpose_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_openpose_sd14v1.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_keypose_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_keypose_sd14v1.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_depth_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_depth_sd14v1.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_color_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_color_sd14v1.pth --check-certificate=false
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet/resolve/main/t2iadapter_canny_sd14v1.pth -d /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_canny_sd14v1.pth --check-certificate=false

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/6987?type=Model&format=SafeTensor" -d /workspace/stable-diffusion-webui/models/Stable-diffusion -o realisticVisionV13_v13.safetensors --check-certificate=false

# sed -i -e '''/    prepare_environment()/a\    os.system\(f\"""sed -i -e ''\"s/dict()))/dict())).cuda()/g\"'' /workspace/stable-diffusion-webui/repositories/stable-diffusion-stability-ai/ldm/util.py""")''' /workspace/stable-diffusion-webui/launch.py
# sed -i -e 's/fastapi==0.90.1/fastapi==0.89.1/g' /workspace/stable-diffusion-webui/requirements_versions.txt

mkdir /workspace/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui/models

python launch.py --listen --xformers --enable-insecure-extension-access --theme dark --gradio-queue --multiple