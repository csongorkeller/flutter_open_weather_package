/// enum that holds all the weather unit related options
enum WeatherUnits { STANDARD, METRIC, IMPERIAL }

Map<WeatherUnits, String> weatherUnitsString = {
  WeatherUnits.IMPERIAL: 'imperial',
  WeatherUnits.METRIC: 'metric',
  WeatherUnits.STANDARD: 'standard'
};
