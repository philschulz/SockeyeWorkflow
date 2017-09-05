task eval : multeval
  < reference=$dev_corpus
  < hypothesis=$plain_text_translation@spm_decode
  :: target_l=$target_language
  :: source_l=$source_language
  > scores {
 
  cd $multeval
  ./multeval.sh --refs $reference.$source_l --hyps-baseline $hypothesis --meteor.language $target_l > scores

}
