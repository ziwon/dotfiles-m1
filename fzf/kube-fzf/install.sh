#!/usr/bin/env bash

file="unkown"

if [[ "${OSTYPE//[0-9.]/}" == "darwin" ]]; then
  file="kubectl-fzf_darwin_amd64.tar.gz"
fi

if  [[ "${OSTYPE//[0-9.]/}" == "linux" ]]; then
  file="kubectl-fzf_linux_amd64.tar.gz"
fi

curl -fLo ~/.tmp/kube-fzf/$file --create-dirs "https://github.com/bonnefoa/kubectl-fzf/releases/latest/download/$file"

pushd ~/.tmp/ >& /dev/null
tar -xf $file -C ./kube-fzf
mv ./kube-fzf/cache_builder /usr/local/bin/cache_builder
pod >& /dev/null

