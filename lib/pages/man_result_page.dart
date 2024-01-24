import 'package:flutter/material.dart';

class ManResultPage extends StatelessWidget {
  final double height;
  final double weight;
  const ManResultPage({super.key, required this.height, required this.weight});

  String _calcBmi(double bmi) {
    String result = '저체중';
    if (bmi >= 35) {
      result = '고도비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상체중';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '당신은 ${_calcBmi(bmi)}입니다',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 키 부분
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 175.5,
                              width: 5,
                              color: Colors.purple,
                            ),
                            Text(
                              '평균\n(175.5cm)',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          children: [
                            Container(
                              height: height,
                              width: 4,
                              color: Colors.white,
                            ),
                            Text(
                              '당신\n($height.cm)',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '한국 남성 평균 키',
                      style: TextStyle(fontSize: 20, color: Colors.purple),
                    )
                  ],
                ),
                // 몸무게
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 74.1,
                              width: 5,
                              color: Colors.purple,
                            ),
                            Text(
                              '평균\n(74.1kg)',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          children: [
                            Container(
                              height: weight,
                              width: 4,
                              color: Colors.white,
                            ),
                            Text(
                              '당신\n(${weight}kg)',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '한국 남성 평균 몸무게',
                      style: TextStyle(fontSize: 20, color: Colors.purple),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
