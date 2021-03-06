#! /usr/bin/env bash

if [[ "$JHUB_VERSION" == "master" ]]; then
	echo "Using jupyterhub master"
	pushd /tmp
	git clone --quiet --depth 1 https://github.com/jupyter/jupyterhub.git
	cd jupyterhub
	pip install -r requirements.txt -e.
	python setup.py js
	python setup.py css
	popd
	echo "Done installing jupyterhub master"
fi

pip install -f travis-wheels/wheelhouse -r requirements.txt .
# Always have to run these to generate JS and CSS
python setup.py js
python setup.py css
