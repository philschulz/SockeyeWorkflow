task spm_train
  > spm_model=spm_model
  :: source_l=$source_language
  :: data=$data_path
  :: target_l=$target_language
  :: num_words=$spm_vocab_size
  :: annotation=@
  :: foreign=$target_language
  :: model=$spm_model_name {
  cat $data/europarl.${foreign}-en/europarl.${foreign}-en.$source_l.aligned.$annotation.train $data/europarl.${foreign}-en/europarl.${foreign}-en.$target_l.aligned.$annotation.train > concat_corpus
  spm_train --input=concat_corpus --vocab_size=$num_words --model_prefix=$model # --input_sentence_size 10M
  rm concat_corpus
  mv $model.model spm_model
}

task spm_encode
  < model=$spm_model@spm_train
  :: format=$spm_format
  :: source_l=$source_language
  :: target_l=$target_language
  :: annotation=@
  :: foreign=$target_language
  :: data=$data_path
  > spm_source_train_encoded=training.bpe.source
  > spm_source_dev_encoded=dev.bpe.source
  > spm_target_train_encoded=training.bpe.target
  > spm_target_dev_encoded=dev.bpe.target
  > spm_source_test_encoded=test.bpe.source {
  spm_encode --model=$model --output_format=$format < $data/europarl.${foreign}-en/europarl.${foreign}-en.$source_l.aligned.$annotation.train > training.bpe.source
  spm_encode --model=$model --output_format=$format < $data/europarl.${foreign}-en/europarl.${foreign}-en.$source_l.aligned.$annotation.dev > dev.bpe.source
  spm_encode --model=$model --output_format=$format < $data/europarl.${foreign}-en/europarl.${foreign}-en.$target_l.aligned.$annotation.train > training.bpe.target
  spm_encode --model=$model --output_format=$format < $data/europarl.${foreign}-en/europarl.${foreign}-en.$target_l.aligned.$annotation.dev > dev.bpe.target
  spm_encode --model=$model --output_format=$format < $data/europarl.${foreign}-en/europarl.${foreign}-en.$source_l.aligned.$annotation.test > test.bpe.source 
}

task spm_decode
  < model=$spm_model@spm_train
  < input=$translation@translate
  :: format=$spm_format
  > plain_text_translation=plain_text_translation {
  
  spm_decode --model=$model --input_format=$format < $input > plain_text_translation

}
