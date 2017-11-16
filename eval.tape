task eval
  < reference=$data_path
  < hypothesis=$plain_text_translation@spm_decode
  :: multeval=$multeval_path
  :: target_l=$target_language
  :: source_l=$source_language 
  > result {
 
  cd $multeval
  ./multeval.sh eval --refs $reference/${source_l}2${target_l}/test.$target_l --hyps-baseline $hypothesis --meteor.language $target_l > scores
  mv scores $result

}
