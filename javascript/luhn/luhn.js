var Luhn = function(number) {

  this.checkDigit = function(){
    stringify_number = number.toString()
    return +stringify_number[stringify_number.length - 1];
  }();

 var addends = this.addends = function(){
    digits = number.toString().split("").reverse();

    for(var i = 0; i < digits.length; i++) {
      if(i % 2 === 0) {
        digits[i] = +digits[i];
      } else {
        new_digit = +digits[i] * 2;
        if(new_digit > 9) { new_digit = new_digit  - 9; }
        digits[i] = new_digit;
      }
    }

    return digits.reverse();
  }();


  var checksum = this.checksum = function(){
    var accumulator = 0;

    for(var i = 0; i < addends.length; i++) {
      accumulator += addends[i];
    }

    return accumulator;
  }();

 this.valid = function(){
    if (checksum % 10 === 0) {
      return true;
    } else {
      return false;
    }
 }();

}

Luhn.create = function(number){
  new_number = number.toString() + '0';
  luhn = new Luhn(+new_number);

  if (luhn.checksum % 10 === 0) {
    return +new_number;
  } else {
    new_number = number.toString() + (10 - luhn.checksum % 10).toString();
    return +new_number;
  }

};

module.exports = Luhn;
