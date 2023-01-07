str=$0 # 脚本的文件路径
path=$(dirname $str) #获得脚本所在文件夹路径 
cd $path
cd ../.. # 跳转到yolov5

# 从另外一个实验的某一轮开始训练可以提高速度
# nohup python -m torch.distributed.run --nproc_per_node 3 train.py --batch 64 --epochs 300 --data "tt100k_2021_2023-01-05-20.yaml" --img 640 --weights pretrained/yolov5m.pt --device 1,2,3  --cfg yolov5m.yaml --hyp data/hyps/hyp.scratch-low.yaml &
# 从头开始训练的话起床可以看到结果。
# nohup python -m torch.distributed.run --nproc_per_node 3 train.py --batch 64 --epochs 300 --data "tt100k_2021_2023-01-05-20.yaml" --img 640 --weights pretrained/yolov5m.pt --device 1,2,3  --cfg yolov5m.yaml --hyp data/hyps/hyp.scratch-low.yaml &

# img是关键参数
# python train.py --img 2048 --batch-size 128 --hyp "实验/tt100k/hyp.分析1.yaml" --data "tt100k_2021_2023-01-05-20.yaml" --epochs 300 --weights pretrained/yolov5m.pt --cfg yolov5m.yaml 
python train.py --img 2048 --batch-size 64 --hyp "实验/tt100k/hyp.分析1.yaml" --data "tt100k_2021_2023-01-05-20.yaml" --epochs 300 --weights pretrained/yolov5m.pt --cfg yolov5m.yaml 


# File "D:\DevEnvironment\anaconda3\envs\torch\lib\multiprocessing\spawn.py", line 126, in _main
#     self = reduction.pickle.load(from_parent)
# EOFError: Ran out of input