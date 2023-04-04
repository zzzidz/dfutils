import argparse
import subprocess

def download_model(model_id, model_type, output_dir, output_file):
    url = f"https://civitai.com/api/download/models/{model_id}?type=Model&format=SafeTensor"
    aria2c_command = [
        "aria2c", "--console-log-level=error", "-c", "-x", "16", "-s", "16", "-k", "1M", url, "-d", output_dir, "-o", output_file, "--check-certificate=false"
    ]

    subprocess.run(aria2c_command)

def main():
    parser = argparse.ArgumentParser(description="Download model from CivitAI")
    parser.add_argument("model", help="Model type: lora or checkpoint")
    parser.add_argument("model_id", help="Model ID")
    parser.add_argument("output_name", help="Output file name without extension")

    args = parser.parse_args()

    if args.model == "lora":
        output_dir = "/workspace/stable-diffusion-webui/extensions/sd-webui-additional-networks/models/lora"
    elif args.model == "checkpoint":
        output_dir = "/workspace/stable-diffusion-webui/models/Stable-diffusion"
    else:
        raise ValueError("Invalid model type. Must be 'lora' or 'checkpoint'.")

    output_file = f"{args.output_name}.safetensors"

    download_model(args.model_id, args.model, output_dir, output_file)

if __name__ == "__main__":
    main()