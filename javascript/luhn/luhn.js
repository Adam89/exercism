var Luhn = function(number) {

  var calculateAddends = function(){
    var digits = number.toString().split("").reverse();

    for(var i = 0; i < digits.length; i++) {
      if(i % 2 === 0) {
        digits[i] = +digits[i];
      } else if(timesTwo(digits[i]) > 9) {
        digits[i] = timesTwo(digits[i]) - 9;
      } else {
        digits[i] = timesTwo(digits[i]);
      }
    }

    return digits.reverse();
  };

  var timesTwo = function(letter) {
    return +letter * 2;
  };

  var calculateChecksum = function(){
    var accumulator = 0;
    var addends = calculateAddends();

    for(var i = 0; i < addends.length; i++) {
      accumulator += addends[i];
    }

    return accumulator;
  };

  var calculateValidity = function(){
    var checksum = calculateChecksum();

    if (checksum % 10 === 0) {
      return true;
    } else {
      return false;
    }
  };


  this.checkDigit = function(){
    var stringify_number = number.toString()
    return +stringify_number[stringify_number.length - 1];
  }();

  this.addends = calculateAddends();
  this.checksum = calculateChecksum();
  this.valid = calculateValidity()
}

Luhn.create = function(number){
  var new_number = number.toString() + '0';
  var luhn = new Luhn(+new_number);

  if (luhn.checksum % 10 === 0) {
    return +new_number;
  } else {
    new_number = number.toString() + (10 - luhn.checksum % 10).toString();
    return +new_number;
  }
};

module.exports = Luhn;
