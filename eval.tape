task eval : multeval
  < reference=$data@data
  < hypothesis=$plain_text_translation@spm_decode
  :: target_l=$target_language 
  > result {
 
  cd $multeval
  ./multeval.sh eval --refs $reference/test.$target_l --hyps-baseline $hypothesis --meteor.language $target_l > scores
  mv scores $result

}
