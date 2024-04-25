import 'package:flutter/material.dart';
import 'package:pertemuan2_bmi/constants/constants.dart';
import 'package:pertemuan2_bmi/helper/bmi_calculator.dart';
import 'package:pertemuan2_bmi/views/bmi_data_screen.dart';

class BMiResultScreen extends StatelessWidget {
  const BMiResultScreen({
    Key? key,
    required this.bmi,
    // required this.bmiCalculator,
  }) : super(key: key); //required wajib diisi agar bisa jalan
  final double bmi;
  // final BmiCalculator? bmiCalculator;

  // String defkatBMI(double hasilBMI) {
  //   String kategori = "";
  //   if (hasilBMI < 16.0) {
  //     kategori = usev;
  //   } else if (hasilBMI >= 16.0 && hasilBMI < 17) {
  //     kategori = umod;
  //   } else if (hasilBMI >= 17.0 && hasilBMI < 18.5) {
  //     kategori = umild;
  //   } else if (hasilBMI >= 18.5 && hasilBMI < 25) {
  //     kategori = norm;
  //   } else if (hasilBMI >= 25 && hasilBMI < 30) {
  //     kategori = owe;
  //   } else if (hasilBMI >= 30 && hasilBMI < 35) {
  //     kategori = obs1;
  //   } else if (hasilBMI >= 35 && hasilBMI < 40) {
  //     kategori = obs2;
  //   } else if (hasilBMI >= 40.0) {
  //     kategori = obs3;
  //   }
  //   return kategori;
  // }

  // String getHRD(String namkat) {
  //   String desc = "";
  //   switch (namkat) {
  //     case usev:
  //       desc = "Possible nutrional deficiency and osteoporosis.";
  //       break;
  //     case umod:
  //       desc = "Possible nutrional deficiency and osteoporosis.";
  //       break;
  //     case umild:
  //       desc = "Possible nutrional deficiency and osteoporosis.";
  //       break;
  //     case norm:
  //       desc = "Low risk (healthy range).";
  //       break;
  //     case owe:
  //       desc =
  //           "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes melitus.";
  //       break;
  //     case obs1:
  //       desc =
  //           "High risk of developing heart disease, high blood pressure, stroke, diabetes militus. Metabolic Syndrome.";
  //       break;
  //     case obs2:
  //       desc =
  //           "High risk of developing heart disease, high blood pressure, stroke, diabetes militus. Metabolic Syndrome.";
  //       break;
  //     case obs3:
  //       desc =
  //           "High risk of developing heart disease, high blood pressure, stroke, diabetes militus. Metabolic Syndrome.";
  //       break;
  //     default:
  //   }
  //   return desc;
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(
        bmi); //memanggil class lain untuk menggambil valuenya
    //final  bmiKat =
    //bmiCalculator.defkatBMI();
    //final bmiDesc =
    //bmiCalculator.getHRD();

    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Hitung BMI"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  child: Center(
            child: Text(
              "Hasil Perhitungan",
              style: judulresultStyle,
            ),
          ))),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, //untuk membuat teks sama rata ditengah
                    children: [
                      SizedBox(height: 20),
                      Text(
                          //melakukan pengecekan (bmiCalculator.bmiCategory?? ==null) ? "" jika bmicat dalamm kategori null, maka bmicat akan mencetak nilai null. jika tidak maka akan mengembalikan nilai dari kategori tersebut
                          //berbeda dengan ketika menggunakan yang bmiCalculator.bmiCategory! yang diisi dengan nilai null maka akan error dan tidak bisa diproses
                          bmiCalculator.bmiCategory ?? "",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                      SizedBox(
                          height: 50), //untuk jarak antara Height dan Angka
                      Text(bmi.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 50),
                      Text(bmiCalculator.bmiDescription ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ]),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                height: 80, //Tinggi Tombol Bawah
                color: Color(0xffEC3C66),
                child: Center(
                  child: Text("Hitung Ulang", style: downButtStyle),
                )),
          ),
        ],
      ),
    );
  }
}
