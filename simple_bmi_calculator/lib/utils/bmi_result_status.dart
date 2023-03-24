///  After calculating the BMI, we need to determine the status of the result.
/// The status is determined by the BMI value.
/// The status is then used to determine the feedback message to be displayed.
/// The status and feedback message are returned as a Map.
/// The status is used to determine the color of the result card.
/// The feedback message is displayed in the result card.

Map<String, String> bmiStatusResult(double bmi) {
  String status = 'Normal';
  String feedback = 'Your weight status is within the healthy range.';
  if (bmi < 18.5) {
    status = 'Underweight';
  } else if (bmi >= 18.5 && bmi < 25) {
    status = 'Normal weight';
  } else if (bmi >= 25 && bmi < 30) {
    status = 'Overweight';
  } else {
    status = 'Obese';
  }

  if (status == 'Underweight') {
    feedback =
        'You may want to consider increasing your calorie intake and/or exercising to build muscle mass.';
  } else if (status == 'Overweight' || status == 'Obese') {
    feedback =
        'You may want to consider reducing your calorie intake and increasing physical activity to promote weight loss.';
  } else {
    feedback = 'Your weight status is within the healthy range.';
  }

  return {'status': status, 'feedback': feedback};
}
