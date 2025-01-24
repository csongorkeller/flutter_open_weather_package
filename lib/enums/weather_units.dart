/// Enum that holds all the weather unit related options.
enum WeatherUnits {
  /// Standard unit.
  STANDARD,

  /// Metric unit.
  METRIC,

  /// Imperial unit.
  IMPERIAL
}

/// A map that associates [WeatherUnits] with their corresponding string representations.
Map<WeatherUnits, String> weatherUnitsString = {
  WeatherUnits.IMPERIAL: 'imperial',
  WeatherUnits.METRIC: 'metric',
  WeatherUnits.STANDARD: 'standard'
};
