#!/bin/bash

docker build . -t image_libfuzzer

for i in {0..7}
do
  docker run -t --name image_libfuzzer-"$i" -d image_libfuzzer "/work/image/fuzz/fuzz.sh" "libfuzzer" $i
done

for i in {0..7}
do
  docker wait image_libfuzzer-"$i"
done
