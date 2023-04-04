#!/usr/bin/env python3
import argparse
import os

parser = argparse.ArgumentParser(description='Download Hugging Face model to a directory using aria2c')
parser.add_argument('link', type=str, help='Hugging Face model link')
parser.add_argument('-d', '--directory', type=str, default='/workspace/stable-diffusion-webui/extensions/sd-webui-additional-networks/models/lora', help='Directory to download the model to')
parser.add_argument('-o', '--output', type=str, help='Name of the output file')
args = parser.parse_args()

if not os.path.exists(args.directory):
    os.makedirs(args.directory)

if args.output is None:
    output_filename = os.path.basename(args.link)
else:
    output_filename = args.output

command = f"aria2c --console-log-level=error -c -x 16 -s 16 -k 1M {args.link} -d {args.directory} -o {output_filename} --check-certificate=false"
os.system(command)