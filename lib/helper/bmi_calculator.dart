import 'dart:math';
import 'package:pertemuan2_bmi/constants/constants.dart';

class BmiCalculator {
  //class yang nantinya dipanggil ke class lain
  int? height;
  int? weight;
  double? bmi; //hasill hitung
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({this.height, this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    //this.bmi = bmi;
  }

  double calculateBmi() {
    double heightInMeter = height! / 100; //mengubah cm ke meter
    bmi = weight! / pow(heightInMeter, 2); //rumus  BMI
    return bmi!; //Lalu lakukan pengembalian nilai  hasil rumus kesini
    //fungsi tanda seru untuk variabel yang bernilai null, dipaksa agar support
  }

  String defkatBMI() {
    bmiCategory = "";
    if (bmi! < 16.0) {
      bmiCategory = usev;
    } else if (bmi! >= 16.0 && bmi! < 17) {
      bmiCategory = umod;
    } else if (bmi! >= 17.0 && bmi! < 18.5) {
      bmiCategory = umild;
    } else if (bmi! >= 18.5 && bmi! < 25) {
      bmiCategory = norm;
    } else if (bmi! >= 25 && bmi! < 30) {
      bmiCategory = owe;
    } else if (bmi! >= 30 && bmi! < 35) {
      bmiCategory = obs1;
    } else if (bmi! >= 35 && bmi! < 40) {
      bmiCategory = obs2;
    } else if (bmi! >= 40.0) {
      bmiCategory = obs3;
    }
    return bmiCategory!;
  }

  String getHRD() {
    bmiDescription = "";
    switch (bmiCategory) {
      case usev:
        bmiDescription = "Possible nutrional deficiency and osteoporosis.";
        break;
      case umod:
        bmiDescription = "Possible nutrional deficiency and osteoporosis.";
        break;
      case umild:
        bmiDescription = "Possible nutrional deficiency and osteoporosis.";
        break;
      case norm:
        bmiDescription = "Low risk (healthy range).";
        break;
      case owe:
        bmiDescription =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes melitus.";
        break;
      case obs1:
        bmiDescription =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes militus. Metabolic Syndrome.";
        break;
      case obs2:
        bmiDescription =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes militus. Metabolic Syndrome.";
        break;
      case obs3:
        bmiDescription =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes militus. Metabolic Syndrome.";
        break;
      default:
    }
    return bmiDescription!;
  }
}
