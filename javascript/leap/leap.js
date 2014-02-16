var isLeapYear = function(year) {

  var calculateDivision = function(number) {
    return (year % number === 0);
  }

  if (calculateDivision(400)) {
    return true;
  }
  else if (calculateDivision(100)) {
    return false;
  }
  else if(calculateDivision(4)) {
    return true;
  };

};

module.exports = isLeapYear;
