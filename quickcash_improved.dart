double roundToNearestMultiple(double number, double multiple) {
  return (number / multiple).ceil() * multiple;
}

List<double> getIntegerOptions(double input) {
  
  List<double> quickcash = [];

  //check if value is near to 100
  
  quickcash.add(roundToNearestMultiple(input, 5));
  quickcash.add(roundToNearestMultiple(input, 10));
  quickcash.add(roundToNearestMultiple(input, 20));
  quickcash.add(roundToNearestMultiple(input, 50));
  quickcash.add(roundToNearestMultiple(input, 100));
  
  quickcash = removeDuplicates(quickcash);
  if (quickcash.length < 3) {
    quickcash.add(roundToNearestMultiple(input, 110));
    quickcash.add(roundToNearestMultiple(input, 120));
    quickcash.add(roundToNearestMultiple(input, 150));
  }
  quickcash = removeDuplicates(quickcash);
  quickcash.sort();
    

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

void main() {

List<double> test_values = [50, 19.22, 51.22, 65, 71.03, 99.08, 47.89, 99.01];

for (int input = 0; input < test_values.length; input++) {
    print((input + 1).toString() +
        ") " +
        "--------------------------------------------------------");
    List<double> quickcash = [];

    quickcash.add(test_values[input]);
    //generate the quick cash int options
    quickcash.add(test_values[input].ceilToDouble());
    quickcash.addAll(getIntegerOptions(test_values[input].ceilToDouble()));
    quickcash = removeDuplicates(quickcash);    
    print(quickcash);
  }
}
