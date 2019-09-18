#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'

for file_url in \
	"https://ml-inat-competition-datasets.s3.amazonaws.com/2021/train.tar.gz train.tar.gz" \
	"https://ml-inat-competition-datasets.s3.amazonaws.com/2021/train.json.tar.gz train.json.tar.gz" \
	"https://ml-inat-competition-datasets.s3.amazonaws.com/2021/train_mini.tar.gz train_mini.tar.gz" \
	"https://ml-inat-competition-datasets.s3.amazonaws.com/2021/train_mini.json.tar.gz train_mini.json.tar.gz" \
	"https://ml-inat-competition-datasets.s3.amazonaws.com/2021/val.tar.gz val.tar.gz" \
	"https://ml-inat-competition-datasets.s3.amazonaws.com/2021/val.json.tar.gz val.json.tar.gz" \
	"https://ml-inat-competition-datasets.s3.amazonaws.com/2021/public_test.tar.gz public_test.tar.gz" \
	"https://ml-inat-competition-datasets.s3.amazonaws.com/2021/public_test.json.tar.gz public_test.json.tar.gz"
do
	echo ${file_url} | git-annex addurl -c annex.largefiles=anything --raw --batch --with-files
done

md5sum -c md5sums
