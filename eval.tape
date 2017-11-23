task eval
  < reference=$data_path
  < hypothesis=$plain_text_translation@spm_decode
  :: multeval=$multeval_path
  :: target_l=$target_language
  :: source_l=$source_language
  :: foreign=$target_language 
  :: annotation=@
  > result {
 
  cd $multeval
  ./multeval.sh eval --refs $reference/europarl.${foreign}-en/europarl.${foreign}-en.$target_l.aligned.$annotation.test --hyps-baseline $hypothesis --meteor.language $target_l > scores
  mv scores $result

}
