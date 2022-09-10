source ~/.bashrc 
curl -sSL https://install.python-poetry.org | python3 -
if [[ $? -ne 0  ]] 
then
    exit $?
fi
echo 'export PATH="/root/.poetry/bin:$PATH"' >> ~/.bashrc