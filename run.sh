#!/bin/bash

docker build . -t image_cargo_libafl

for i in {0..7}
do
  docker run -t --name image_cargo_libafl-"$i" -d image_cargo_libafl "/work/image/fuzz/fuzz.sh" "cargo_libafl" $i
done

for i in {0..7}
do
  docker wait image_cargo_libafl-"$i"
done
