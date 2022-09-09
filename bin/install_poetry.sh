eval "$(pyenv init --path)"
eval "$(pyenv init -)"
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="/root/.poetry/bin:$PATH"' >> ~/.bashrc