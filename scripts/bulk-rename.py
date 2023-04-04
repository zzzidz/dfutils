import os
import re
import shutil

def wsl_windows_path_to_linux(windows_path):
    drive_regex = r'^([a-zA-Z]):\\'
    match = re.search(drive_regex, windows_path)
    if not match:
        raise ValueError(f"Invalid Windows path: '{windows_path}'")
    drive_letter = match.group(1).lower()
    linux_path = re.sub(drive_regex, f'/mnt/{drive_letter}/', windows_path)
    linux_path = linux_path.replace('\\', '/')
    return linux_path

def rename_images_in_folder(folder_path):
    # List all files in the folder
    files = os.listdir(folder_path)

    # Filter only image files (assuming common image extensions)
    image_extensions = ('.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff')
    image_files = [f for f in files if f.lower().endswith(image_extensions)]

    # Sort image files alphabetically
    image_files.sort()

    # Rename the image files with a numerical sequence (1 to n)
    for i, image_file in enumerate(image_files, start=1):
        old_file_path = os.path.join(folder_path, image_file)
        file_extension = os.path.splitext(image_file)[1]
        new_file_name = f"{i}{file_extension}"
        new_file_path = os.path.join(folder_path, new_file_name)
        shutil.move(old_file_path, new_file_path)
        print(f"Renamed '{old_file_path}' to '{new_file_path}'")

if __name__ == "__main__":
    # Set the folder path containing images (Windows path)
    windows_folder_path = "G:\\preprocess\\lgiang\\birme-768x768 (3)"

    # Convert the Windows path to the corresponding WSL Linux path
    linux_folder_path = wsl_windows_path_to_linux(windows_folder_path)

    # Call the function to rename images in the specified folder
    rename_images_in_folder(linux_folder_path)