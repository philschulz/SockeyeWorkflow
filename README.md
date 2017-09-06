# SockeyeWorkflow
A workflow for experimenting with the Sockeye NMT system

## Ingredients
This workflow will download and build the following: 

* a version of sockeye (currently from a private repo, so please change that to the [public sockeye repo](https://github.com/awslabs/sockeye) -> the repositories are specified in [packages.tape](packages.tape)). 
* Google's [sentence piece](https://github.com/google/sentencepiece) software for creating subword units.
* [Multeval](https://github.com/jhclark/multeval) for the evaluation of the models.

## Manipulating the workflow
While you are of course welcome to adjust the workflow to your needs, for basic models it should suffice to set the appropriate parameters in [sockeye.tconf](sockeye.tconf).

# Dependencies
First and foremost you need [ducttape](https://github.com/jhclark/ducttape). You can get a ready-built version by typing
```
wget http://www.cs.cmu.edu/~jhclark/downloads/ducttape-0.3.tgz
tar -xvzf ducttape-0.3.tgz
export PATH=$PWD/ducttape-0.3:$PATH
```

You will also need to install ant (for building multeval). The ant binaries can be found [here](https://ant.apache.org/bindownload.cgi). Furthermore you need glibtool in order to build sentence piece. You get it as follows:
```
sudo apt-get install libtool-bin
```

Finally, the pulled sockeye version requires cuda8.

# Executing the workflow
After all the above, simply type
```
ducttape workflow.tape -C sockeye.tconf
```

# Known Issues
At the moment it sockeye fails to build the first time. Simply run the workflow again and then everything should be fine. I'll dig into why this happens.
