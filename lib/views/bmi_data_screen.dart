import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pertemuan2_bmi/constants/constants.dart';
import 'package:pertemuan2_bmi/helper/bmi_calculator.dart';
import 'package:pertemuan2_bmi/views/bmi_result_screen.dart';
import 'dart:math';

class BmiDataScreen extends StatefulWidget {
  @override
  _BmiDataScreenState createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height =
      100; //wajib pakai Interger agar di aplikasi angkanya menjadi bulat
  int weight = 50;
  int age = 20;

  // double calculateBmi() {
  //   double heightInMeter = height / 100; //mengubah cm ke meter
  //   final jawabanBMI = weight / pow(heightInMeter, 2); //rumus  BMI
  //   return jawabanBMI; //Lalu lakukan pengembalian nilai hasil rumus kesini
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0A0E21), //menggubah tema Appbar
        appBar: AppBar(
          title: Text("BMI Kalkulator"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                      child: GenderIconText(icon: Icons.male, title: 'male')),
                ),
                Expanded(
                  child: BmiCard(
                      child:
                          GenderIconText(icon: Icons.female, title: 'female')),
                )
              ],
            )),
            Expanded(
              child: Container(
                  child: BmiCard(
                      child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, //memindah Teks ke tengah
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ), //fungsi copyWith untuk mengambil Style yang sama lalu di modif sesuai settingan manual
                  ),
                  SizedBox(height: 12), //untuk jarak antara Height dan Angka

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //memindah Teks ke tengah
                    children: [
                      Text(
                        "$height", //fungsi $ adalah untuk interclass atau convert String ke Double
                        style: numberStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height
                        .toDouble(), //untuk mengkonversi height yang sebelumnya int menjadi double, karena Slider hanya bisa Double
                    min: 80,
                    max: 200,
                    onChanged: (value) {
                      height = value
                          .toInt(); //untuk mengkonversi height hasil yang Double ke Int
                      setState(() {});
                    },
                  )
                ],
              ))),
            ),
            Expanded(
                child: Container(
                    child: Row(
              children: [
                Expanded(
                    child: BmiCard(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //memindah Teks ke tengah(
                    children: [
                      Text("WEIGHT", style: labelTextStyle),
                      Text("$weight", style: numberStyle),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, //memindah Teks ke tengah
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              weight++; //weight akan bertambah 1
                              setState(() {});
                            },
                            elevation: 0,
                            child: Icon(Icons.add),
                            shape: CircleBorder(),
                            fillColor: Color(0xff212747),
                            constraints: BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                          ),
                          SizedBox(width: 10),
                          RawMaterialButton(
                            onPressed: () {
                              weight--; //mengurangi weight -1
                              setState(() {});
                            },
                            elevation: 0,
                            child: Icon(Icons.remove),
                            shape: CircleBorder(),
                            fillColor: Color(0xff212747),
                            constraints: BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: BmiCard(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //memindah Teks ke tengah(
                    children: [
                      Text("AGE", style: labelTextStyle),
                      Text("$age", style: numberStyle),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, //memindah Teks ke tengah
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              age++;
                              setState(() {});
                            },
                            elevation: 0,
                            child: Icon(Icons.add),
                            shape: CircleBorder(),
                            fillColor: Color(0xff212747),
                            constraints: BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                          ),
                          SizedBox(width: 10),
                          RawMaterialButton(
                            onPressed: () {
                              age--;
                              setState(() {});
                            },
                            elevation: 0,
                            child: Icon(Icons.remove),
                            shape: CircleBorder(),
                            fillColor: Color(0xff212747),
                            constraints: BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ))),
            GestureDetector(
              onTap: () {
                //print(calculateBmi());
                final bmiCalculator = BmiCalculator(
                    height: height,
                    weight:
                        weight); //fungsi untuk mengambil variabel pada di class  bmi calc
                bmiCalculator.calculateBmi();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) {
                      return BMiResultScreen(
                        bmi: bmiCalculator.bmi!,
                      );
                    }),
                  ),
                );
              },
              child: Container(
                  height: 80, //Tinggi Tombol Bawah
                  color: Color(0xffEC3C66),
                  child: Center(
                    child: Text("Hitung BMI", style: downButtStyle),
                  )),
            ),
          ],
        ));
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xff272A4E), borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //agar ketengah
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
