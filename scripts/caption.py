import os
from PIL import Image

# Set the path to the folder containing the images
folder_path = "/path/to/folder"

# Loop through all the files in the folder
for filename in os.listdir(folder_path):
    # Check if the file is an image
    if filename.endswith(".jpg") or filename.endswith(".jpeg") or filename.endswith(".png"):
        # Open the image and extract its metadata
        with Image.open(os.path.join(folder_path, filename)) as img:
            size = img.size
            format = img.format
            exif_data = img.getexif()
            # Create a caption with the metadata
            caption = f"This is an image of size {size[0]}x{size[1]}, in {format} format."
            if exif_data:
                if 306 in exif_data:
                    caption += f" It was taken with a {exif_data[306]} camera."
                if 36867 in exif_data:
                    caption += f" It was taken on {exif_data[36867]}."
            # Print the caption
            print(f"{filename}: {caption}")