#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'

_SNAME=$(basename "$0")

source scripts/utils.sh echo -n

mkdir -p logs/

python3 -m pip install -r scripts/requirements_torchvision.txt

# Rename data files to what torchvision will look for
git mv train.tar.gz 2021_train.tgz
git mv train_mini.tar.gz 2021_train_mini.tgz
git mv val.tar.gz 2021_valid.tgz
git-annex fsck --fast .

python3 scripts/preprocess_torchvision.py \
	1>>logs/${_SNAME}.out_$$ 2>>logs/${_SNAME}.err_$$

# Delete raw files
git rm -rf 2021_train*.tgz 2021_valid.tgz md5sums

for d in 2021_train*/*/ 2021_valid/*/ ; do printf "%s\n" "${d}" ; done | ./scripts/stats.sh
