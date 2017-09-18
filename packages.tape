package spm :: .versioner=git .repo="https://github.com/google/sentencepiece.git" .ref=HEAD {
  ./autogen.sh
  ./configure prefix=`pwd`
  make && make check && make install
}

package sockeye :: .versioner=git .repo="git@github.com:philschulz/sockeye-experimental.git" .ref=HEAD {
  pip install mxnet-cu80==0.10.0 pyyaml
  python setup.py install --no-deps
  # python setup.py install -r requirements.gpu-cu80.txt
  # pip install -e '.[optional]'
}

package multeval :: .versioner=git .repo="git://github.com/jhclark/multeval.git" .ref=HEAD {
  ./get_deps.sh
  ant
}

