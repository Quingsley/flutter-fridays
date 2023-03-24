/// A function that calculates the BMI based on the given parameters(height, weight, age, gender).
/// The function returns the calculated BMI.
///
///

double calculateBMI(double height, double weight, int age, String? gender) {
  double bmi;
  if (gender == null) {
    return 0;
  }
  // Convert height from centimeters to meters
  height = height / 100;

  // Calculate BMI
  bmi = weight / (height * height);

  // Adjust BMI based on age and gender
  if (age < 18) {
    bmi += (gender == 'male') ? -1.0 : 1.0;
  } else if (age >= 18 && age < 25) {
    bmi += (gender == 'male') ? -0.5 : 0.5;
  } else if (age >= 25 && age < 40) {
    bmi += (gender == 'male') ? 0.0 : 1.0;
  } else if (age >= 40 && age < 60) {
    bmi += (gender == 'male') ? 0.5 : 1.5;
  } else {
    bmi += (gender == 'male') ? 1.0 : 2.0;
  }
  return bmi;
}
