from pathlib import Path

this_file = Path(__file__).resolve()
this_directory = this_file.parent
project_root= this_directory.parent.parent.parent
import os

video_path = project_root/'datasets/sustech_video/'
for video_file in video_path.glob('*.mp4'):
    print(video_file.name)
    command = f"python {project_root/'detect.py'} --weights {project_root/'runs/train/exp22/weights/best.pt'} --source {video_file} --img 640  --data {project_root/'data/sustech_traffic_sign_2023-01-07-21.yaml'}"
    # command = f"python {project_root/'detect.py'} --agnostic-nms --weights {project_root/'runs/train/exp22/weights/best.pt'} --source {video_file} --img 640  --data {project_root/'data/sustech_traffic_sign_2023-01-07-21.yaml'}"
    os.system(command)
# python detect.py --weights runs/train/exp22/weights/best.pt --source 'datasets/sustech_video/VID_20230107_183038.mp4' --img 640  --data "sustech_traffic_sign_2023-01-07-21.yaml" --agnostic-nms
