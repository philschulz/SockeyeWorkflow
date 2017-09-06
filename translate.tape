task average : sockeye
  < model=$sockeye_model@train_model
  :: checkpoints=$best_checkpoints
  :: metric=$averaging_metric
  > averaged_model=averaged_model {
 
  cpi -r $model averaged_model
  python -m sockeye.average -o averaged_model/param.best -n $checkpoints --metric $metric

}

task translate : sockeye 
  < model=$sockeye_model@train_model
  < input=$spm_source_test_encoded@spm_encode
  :: beam=$beam_size 
  > translation=translation {

  python -m sockeye.translate --use-cpu --models $model --input $input --output translation

}
