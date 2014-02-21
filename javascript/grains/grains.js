var Grains = function(){
  this.square = function(number){
    return Math.pow(2,(number-1));
  }

  this.total = function(){
    var result = 0;
    for(var i = 0; i < 65; i++) {
      result += this.square(i);
    }
    return result;
  }
}
module.exports = Grains;
