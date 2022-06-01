#!/bin/bash
source ~/.bashrc

poetry install --no-dev
poetry build
poetry run pip install --upgrade -t python dist/*.whl
zip -r deployment-package.zip python -x '*.pyc'