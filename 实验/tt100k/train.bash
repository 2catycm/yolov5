str=$0 # 脚本的文件路径
path=$(dirname $str) #获得脚本所在文件夹路径 
cd $path
cd ../.. # 跳转到yolov5

# conda activate yolov5
# nohup &
# https://blog.csdn.net/chen1234520nnn/article/details/123380611#:~:text=nohup%20%E7%9A%84%E6%84%8F%E6%80%9D%E6%98%AF%E4%B8%8D%E9%97%B4%E6%96%AD%E7%9A%84%E8%BF%90%E8%A1%8C%EF%BC%8C%26%E7%9A%84%E6%84%8F%E6%80%9D%E6%98%AF,%E5%90%8E%E5%8F%B0%E8%BF%90%E8%A1%8C%20%EF%BC%8C2%3E%261%E7%9A%84%E6%84%8F%E6%80%9D%E6%98%AF%E6%A0%87%E5%87%86%E8%BE%93%E5%87%BA%E5%92%8C%E9%94%99%E8%AF%AF%E8%BE%93%E5%87%BA%E9%83%BD%E9%87%8D%E5%AE%9A%E5%90%91%E5%88%B0%E5%90%8C%E4%B8%80%E4%B8%AA%E6%96%87%E4%BB%B6%E3%80%82


# 基础训练命令
# python train.py --data "tt100k_2021_2023-01-05-20.yaml" --epochs 300 --weights '' --cfg yolov5n.yaml  --batch-size 128
#                                                                 #  yolov5s                    64
#                                                                 #  yolov5m                    40
#                                                                 #  yolov5l                    24
#                                                                 #  yolov5x                    16

# DDP GPU命令
#--nproc_per_node specifies how many GPUs you would like to use. In the example above, it is 2.
# --batch  is the total batch-size. It will be divided evenly to each GPU. In the example above, it is 64/2=32 per GPU.
# python -m torch.distributed.run --nproc_per_node 4 train.py --batch 128 --epochs 300 --data "tt100k_2021_2023-01-05-20.yaml" --img 640--weights yolov5l.pt --device 0,1,2,3

# initial result 指令
# 这个out of memory了
# python -m torch.distributed.run --nproc_per_node 4 train.py --batch 128 --epochs 300 --data "tt100k_2021_2023-01-05-20.yaml" --img 640 --weights pretrained/yolov5l.pt --device 0,1,2,3  --cfg yolov5l.yaml --hyp data/hyps/hyp.scratch-low.yaml
# python -m torch.distributed.run --nproc_per_node 4 train.py --batch 64 --epochs 300 --data "tt100k_2021_2023-01-05-20.yaml" --img 640 --weights pretrained/yolov5l.pt --device 0,1,2,3  --cfg yolov5l.yaml --hyp data/hyps/hyp.scratch-low.yaml
# nohup python -m torch.distributed.run --nproc_per_node 4 train.py --batch 64 --epochs 300 --data "tt100k_2021_2023-01-05-20.yaml" --img 640 --weights pretrained/yolov5m.pt --device 0,1,2,3  --cfg yolov5m.yaml --hyp data/hyps/hyp.scratch-low.yaml &
nohup python -m torch.distributed.run --nproc_per_node 4 train.py --batch 64 --epochs 100 --data "tt100k_2021_2023-01-05-20.yaml" --img 640 --weights pretrained/yolov5m.pt --device 0,1,2,3  --cfg yolov5m.yaml --hyp data/hyps/hyp.scratch-low.yaml &


# 
python train.py --img 640 --batch 16 --hyp "实验/tt100k/hyp.分析1.yaml" --epochs 300 --save-period 4 --data "tt100k_2021_2023-01-05-20.yaml"  --weights pretrained/yolov5m.pt  --cfg yolov5m.yaml



python train.py --img 640 --batch 16 --hyp "实验/tt100k/hyp.分析1.yaml" --epochs 1 --save-period 4 --data "tt100k_2021_2023-01-05-20.yaml"  --weights 实验/tt100k/超参实验1/weights/best.pt  --cfg yolov5m.yaml