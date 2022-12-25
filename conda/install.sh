#!/usr/bin/env bash

cat <<'EOF'
 a88888b.                         dP
d8'   `88                         88
88        .d8888b. 88d888b. .d888b88 .d8888b.
88        88'  `88 88'  `88 88'  `88 88'  `88
Y8.   .88 88.  .88 88    88 88.  .88 88.  .88
 Y88888P' `88888P' dP    dP `88888P8 `88888P8
EOF

# Python 3.8 (recommended). Python 3.7 through 3.10 are supported and tested.
: ${PY_VERSION:=3.10}
: ${TORCH_GPU_ENV:=torch-gpu}
: ${MY_CONDA_HOME:=$HOME/Workspace/miniconda}

echo "PY_VERSION: $PY_VERSION"

rm -rf $MY_CONDA_HOME >/dev/null 2>&1
curl -sLf -o $HOME/Workspace/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
bash $HOME/Workspace/miniconda.sh -b -p $MY_CONDA_HOME

export PATH=$PATH:$HOME/Workspace/miniconda/bin
conda create -n $TORCH_GPU_ENV python=$PY_VERSION -y
conda activate $TORCH_GPU_ENV || {
	conda init zsh
  conda init bash
	conda install -p $MY_CONDA_HOME/envs/$TORCH_GPU_ENV pytorch torchvision torchaudio -c pytorch -c conda-forge -y
	conda install -p $MY_CONDA_HOME/envs/$TORCH_GPU_ENV -c conda-forge jupyter jupyterlab -y
}

echo "Conda installed. Please, start a new shell and run the following scripts."
echo "> conda activate $TORCH_GPU_ENV"
echo "> python3 -c \"import torch; print(torch.backends.mps.is_available()); print(torch.backends.mps.is_built())\""


