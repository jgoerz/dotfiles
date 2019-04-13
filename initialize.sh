#!/usr/bin/env bash

has_python3=$(python3 << EOF
print("you have python3!")
EOF
)

if [ $? != 0 ]; then
  echo ""
  echo "Need to install python3, pip3"
  echo "pip3 install pynvim"
  echo ""
  exit 1
fi

mkdir -p pack/minpac/{opt,start}
if ! [ -d pack/minpac/opt/minpac ]; then
  git clone git@github.com:k-takata/minpac.git pack/minpac/opt/minpac
fi
echo ""
echo "open up vim and run :call minpack#update()<CR>"
echo ""
