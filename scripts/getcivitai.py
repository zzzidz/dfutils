import argparse
import subprocess

def download_model(model_id, model_type, output_dir, output_file):
    url = f"https://civitai.com/api/download/models/{model_id}"
    print("Load model at", url)
    aria2c_command = [
        "aria2c", "--console-log-level=error", "-c", "-x", "16", "-s", "16", "-k", "1M", url, "-d", output_dir, "-o", output_file, "--check-certificate=false"
    ]

    subprocess.run(aria2c_command)

def main():
    parser = argparse.ArgumentParser(description="Download model from CivitAI")
    parser.add_argument("model", help="Model type: lora, checkpoint or embeddings")
    parser.add_argument("model_id", help="Model ID")
    parser.add_argument("output_name", help="Output file name without extension")

    args = parser.parse_args()

    if args.model == "lora":
        output_dir = "/workspace/stable-diffusion-webui/extensions/sd-webui-additional-networks/models/lora"
        output_file_ext = ".safetensors"
    elif args.model == "checkpoint":
        output_dir = "/workspace/stable-diffusion-webui/models/Stable-diffusion"
        output_file_ext = ".safetensors"
    elif args.model == "embeddings":
        output_dir = "/workspace/stable-diffusion-webui/embeddings"
        output_file_ext = ".pt"
    else:
        raise ValueError("Invalid model type. Must be 'lora', 'checkpoint', or 'embeddings'.")

    output_file = f"{args.output_name}{output_file_ext}"

    download_model(args.model_id, args.model, output_dir, output_file)

if __name__ == "__main__":
    main()

if __name__ == "__main__":
    main()