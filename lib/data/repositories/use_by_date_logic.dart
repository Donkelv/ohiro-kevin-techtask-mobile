



bool isPastUseByDate(String useByDate, DateTime currentDate) {
  // Parse the 'use-by' date string into a DateTime object
  DateTime? useByDateTime = DateTime.tryParse(useByDate);

  // Check if the parsing was successful and the date is not null
  if (useByDateTime != null) {
    // Get the current date
    //DateTime currentDate = DateTime.now();

    // Compare the 'use-by' date with the current date
    if (useByDateTime.isBefore(currentDate)) {
      // 'use-by' date is in the past
      return true;
    }
  }

  // 'use-by' date is either in the future or parsing failed
  return false;
}
