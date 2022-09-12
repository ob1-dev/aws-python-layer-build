#!/bin/bash
source ~/.bashrc

if [[ -n $1 ]]; then
  CWD=`pwd`
  echo "Changing to $1"
  cd $1
fi

poetry config virtualenvs.prefer-active-python true
poetry install --no-dev
poetry build
poetry run pip install --upgrade -t python dist/*.whl
rm deployment-package.zip
zip -r deployment-package.zip python -x '*.pyc'

if [[ -n $CWD ]]; then
  cd $CWD
fi