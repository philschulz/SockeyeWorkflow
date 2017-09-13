# SockeyeWorkflow
A workflow for experimenting with the Sockeye NMT system. It downloads the IWSLT data for experiments. No preprocessing is done since the workflow uses sentencepiece which does all the necessary preprocessing in one go. Importantly, evaluation with Multeval is done on the original text (no recasing, tokenisation or the like). The available language pairs are English paired with Arabic, Czech, German and French.

**Important:** If you want to use this workflow with an NMT system different from sockeye, you will need to modify ```train_model.tape``` and download the necessary software using ```packages.tape```. Finally, you can manipulate ```data.tape``` to use different data sets. There should be no need to touch any of the other tapes.

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

To ensure that the dependencies of sentencepiece and multeval are satisfied, run
```
sudo apt-get install autoconf automake libtool libprotobuf-c++ protobuf-compiler libprotobuf-dev ant
```

Notice that the pulled sockeye version requires cuda8.

# Executing the workflow
After all the above, simply type
```
ducttape workflow.tape -C sockeye.tconf -O <path to output directory>
```

# Known Issues
At the moment it sockeye fails to build the first time. Simply run the workflow again and then everything should be fine. I'll dig into why this happens.
