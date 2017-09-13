task average : sockeye
  < model=$sockeye_model@train_model
  :: checkpoints=$best_checkpoints
  :: metric=$averaging_metric
  > averaged_model=averaged_model {
 
  cp -r $model averaged_model
  python -m sockeye.average -o averaged_model/param.best -n $checkpoints --metric $metric $model

}

task translate : sockeye 
  < model=$averaged_model@average
  < input=$spm_source_test_encoded@spm_encode
  :: beam=$beam_size 
  > translation=translation {

  python -m sockeye.translate --use-cpu --models $model --input $input --output translation

}
