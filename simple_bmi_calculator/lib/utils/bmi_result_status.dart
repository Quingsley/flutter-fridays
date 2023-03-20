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
