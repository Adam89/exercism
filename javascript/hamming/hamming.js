this.compute = function(strand_one, strand_two){
  var hamming_distance = 0;

  if(strand_one.length <= strand_two.length) {
    compareStrands(strand_one, strand_two);
  } else {
    compareStrands(strand_two, strand_one);
  }

  function compareStrands(short_strand, long_strand) {
    for(var i = 0; i < short_strand.length; i++) {
      if(short_strand[i] != long_strand[i]){
        hamming_distance += 1;
      }
    }
  }

  return hamming_distance;
};
