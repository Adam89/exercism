var SpaceAge = function(input) {

  var earthYearInSeconds = 31557600;

  this.seconds = input;

  var calculateAgeOnPlanet = function(earthYear) {
    return (input/earthYearInSeconds) / earthYear;
    };

    var roundNumber= function(number) {
      return Math.round(number * 100) / 100;
    };

    this.onEarth = function(){
      return roundNumber(calculateAgeOnPlanet(1));
    };

    this.onMercury = function(){
      return roundNumber(calculateAgeOnPlanet(0.2408467));
    };

    this.onVenus = function(){
      return roundNumber(calculateAgeOnPlanet(0.61519726));
    }

    this.onMars = function(){
      return roundNumber(calculateAgeOnPlanet(1.8808158));
    };

    this.onJupiter = function(){
      return roundNumber(calculateAgeOnPlanet(11.862615));
    };

    this.onSaturn = function(){
      return roundNumber(calculateAgeOnPlanet(29.447498));
    };

    this.onUranus = function() {
      return roundNumber(calculateAgeOnPlanet(84.016846));
    };

    this.onNeptune = function() {
      return roundNumber(calculateAgeOnPlanet(164.79132));
    };
  };

  module.exports = SpaceAge;
