#!/bin/bash

docker build . -t image_libafl_libfuzzer

for i in {0..7}
do
  docker run -t --name image_libafl_libfuzzer-"$i" -d image_libafl_libfuzzer "/work/image/fuzz/fuzz.sh" "libafl_libfuzzer" $i
done

for i in {0..7}
do
  docker wait image_libafl_libfuzzer-"$i"
done
