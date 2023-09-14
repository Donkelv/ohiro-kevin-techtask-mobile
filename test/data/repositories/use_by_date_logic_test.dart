import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/data/repositories/use_by_date_logic.dart';

void main() {
  group('isPastUseByDate', () {
    test('Should return true if use-by date is in the past', () {
      // Define a use-by date in the past
      String useByDate = '2023-09-30';

      // Create a current date that is after the use-by date
      DateTime currentDate = DateTime.parse('2023-10-01');

      // Call the function
      bool result = isPastUseByDate(useByDate, currentDate);

      // Expect the result to be true
      expect(result, true);
    });

    test('Should return false if use-by date is in the future', () {
      // Define a use-by date in the future
      String useByDate = '2023-09-30';

      // Create a current date that is before the use-by date
      DateTime currentDate = DateTime.parse('2023-09-01');

      // Call the function
      bool result = isPastUseByDate(useByDate, currentDate);

      // Expect the result to be false
      expect(result, false);
    });

    test('Should return false if parsing fails', () {
      // Define an invalid use-by date
      String useByDate = 'invalid-date';

      // Create a current date
      DateTime currentDate = DateTime.parse('2023-09-01');

      // Call the function
      bool result = isPastUseByDate(useByDate, currentDate);

      // Expect the result to be false
      expect(result, false);
    });
  });
}
