# 把这个转化为tt100k的格式
from pathlib import Path

this_file = Path(__file__).resolve()
this_directory = this_file.parent

out_labels_path = this_directory / 'labels'

from datetime import datetime
_current_time = f"_{datetime.now().strftime('%Y-%m-%d-%H')}"


import yaml

tt100_yaml_path = this_directory.parent.parent/'data'/'tt100k_2021_2023-01-05-20.yaml'
input_yaml_path = this_directory.parent.parent/'data'/f'sustech_traffic_sign{""}.yaml'
output_yaml_path = this_directory.parent.parent/'data'/f'sustech_traffic_sign{_current_time}.yaml'

with open(tt100_yaml_path, 'r') as f:
    tt100_dict = yaml.load(f, Loader=yaml.FullLoader)
std_names = tt100_dict['names']

std_name2index = {name: i for i, name in std_names.items()}

with open(input_yaml_path, 'r') as f:
    input_yaml = yaml.load(f, Loader=yaml.FullLoader)
old_names = input_yaml['names']

#%%
# 转换labels_path
for label_file in out_labels_path.glob('*.txt'):
    in_label_file = out_labels_path.parent.parent/'sustech_traffic_sign'/'labels'/label_file.name
    with open(in_label_file, 'r') as f:
        input_lines = f.readlines()
    with open(label_file, 'w') as f:
        def line_convert(line):
            splits = line.split()
            splits[0] = str(std_name2index[old_names[int(splits[0])]])
            return ' '.join(splits)+'\n'
        f.writelines(map(line_convert, input_lines))


#%%
# 转换yaml

input_yaml['names'] = std_names
input_yaml['nc'] = len(std_names)
input_yaml['path'] = this_directory.relative_to(this_directory.parent.parent).as_posix()
with open(output_yaml_path, 'w') as f:
    yaml.dump(dict(input_yaml), f)