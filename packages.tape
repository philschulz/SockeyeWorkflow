package spm :: .versioner=git .repo="https://github.com/google/sentencepiece.git" .ref=HEAD {
  ./autogen.sh
  ./configure prefix=`pwd`
  make && make check && make install
}

package sockeye :: .versioner=git .repo="git@github.com:philschulz/sockeye-experimental.git" .ref=HEAD {
  python setup.py develop --no-deps
}

package multeval :: .versioner=git .repo="git://github.com/jhclark/multeval.git" .ref=HEAD {
  ./get_deps.sh
  ant
}

