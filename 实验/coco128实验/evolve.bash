for i in 0 1 2 3; do
#   sleep $(expr 30 \* $i) &&  # 30-second delay (optional)
  echo 'Starting GPU '$i'...' &&
  nohup python train.py --epochs 100 --data coco128.yaml --weights pretrained/yolov5s.pt --cache --device $i --evolve > evolve_gpu_$i.log &
done