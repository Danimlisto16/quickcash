bool hasDecimal(String input) {
  // Parse input as a double
  double? numberInput = double.tryParse(input);

  // Check if the parsed number is not null and has decimals
  if (numberInput != null && numberInput != numberInput.toInt()) {
    return true; // Input has decimals
  } else {
    return false; // Input does not have decimals
  }
}

double roundToNearestMultiple(double number, double multiple) {
  return (number / multiple).ceil() * multiple;
}

double getDecimalPart(double value) {
  // Get the integer part of the value
  int intValue = value.toInt();

  // Get the decimal part by subtracting the integer part from the original value
  double decimalPart = value - intValue;

  return decimalPart;
}

List<double>getIntegerOptions(double input){
  
  List<double> quickcash = [];
  //quickcash.add(roundToNearestMultiple(input, 1));
  quickcash.add(roundToNearestMultiple(input, 2));
  quickcash.add(roundToNearestMultiple(input, 5));
  quickcash.add(roundToNearestMultiple(input, 10));
  quickcash.add(roundToNearestMultiple(input, 20));
  quickcash.add(roundToNearestMultiple(input, 50));
  quickcash.add(roundToNearestMultiple(input, 100));

  return quickcash;
}

List<T> removeDuplicates<T>(List<T> list) {
  Set<T> uniqueValues = {};
  List<T> result = [];

  for (T item in list) {
    if (!uniqueValues.contains(item)) {
      result.add(item);
      uniqueValues.add(item);
    }
  }

  return result;
}

List<double> getDecimalOptions(double input) {
  List<double> coins = [0.01, 0.05, 0.10, 0.25, 0.50];
  List<double> quickcash = [];
  double decimalPart = getDecimalPart(input);

  int decimalIndex = coins.indexOf(decimalPart);

  if (decimalIndex != -1) {
    for (int number = decimalIndex; number < coins.length; number++) {
      if (decimalPart <= coins[number]) {
        quickcash.add(input.toInt() + coins[number]);
      }
    }
  } else {
    double roundedNumber = roundToNearestMultiple(decimalPart, 0.05);
    quickcash.add(roundedNumber + input.toInt());
    if (decimalPart < 0.5) {

      quickcash.add((input * 10).ceil() / 10);
      for (int number = 0; number < coins.length; number++) {
        if (decimalPart < coins[number]) {
          quickcash.add(input.toInt() + coins[number]);
        }
      }
    } else {
      quickcash.add((input * 10).ceil() / 10);
      if (decimalPart <= 0.75) {
        quickcash.add(input.toInt() + 0.75);
      }
    }
  }
  return quickcash;
}


void main() {
  List<double> quickcash = [];
  int decimalOptions = 4;
  double input = 711.71;
  // double input = 11.00;
  // double input = 29.75;
  // double input = 1963.5;
  // double input = 209.12;
  
  quickcash.add(input);
  input = input.ceilToDouble();
  quickcash.add(input);
  quickcash.addAll(getIntegerOptions(input));
  quickcash = removeDuplicates(quickcash);
  quickcash.sort();
  print(quickcash);

}
