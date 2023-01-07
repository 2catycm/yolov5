# python val.py --weights runs/train/exp22/weights/best.pt --img 640 --data "sustech_traffic_sign.yaml"  --verbose 
# python val.py --weights runs/train/exp22/weights/best.pt --img 640 --data "sustech_traffic_sign_2023-01-07-20.yaml"  --verbose 
python val.py --weights runs/train/exp22/weights/best.pt --img 640 --data "sustech_traffic_sign_2023-01-07-21.yaml"  --verbose 

# 结果：
#  Class     Images  Instances          P          R      mAP50   mAP50-95: 100%|██████████| 1/1 [00:01<00:00,  1.57s/it]
#                    all         32         29      0.811      0.359       0.46       0.29
#                     ip         32          3      0.802          1      0.995      0.452
#                   pl15         32          2      0.868        0.5      0.559      0.391
#                    i14         32          4          1          0          0          0
#                    pne         32          8      0.586      0.125      0.431       0.28
#                  ph4.5         32          2          1          0      0.216      0.151
#                   pl30         32          8        0.7       0.25      0.483      0.349
#                    w57         32          1      0.534          1      0.995      0.697
#                    w31         32          1          1          0          0          0