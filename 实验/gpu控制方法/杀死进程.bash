# https://blog.csdn.net/ftimes/article/details/121146992
# kill $(ps aux | grep YOUR_TRAINING_SCRIPT.py | grep -v grep | awk '{print $2}')
kill $(ps aux | grep train.py | grep -v grep | awk '{print $2}')
