import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  TextEditingController _heightTextEditingController = TextEditingController();
  TextEditingController _weightTextEditingController = TextEditingController();
  String heightText = '';
  String weightText = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '비만도 계산기',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 36,
              ),
              // height 텍스트필드
              Center(
                  child: SizedBox(
                height: 100,
                width: 300,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '키를 입력하세요';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    setState(() {
                      heightText = text;
                    });
                  },
                  controller: _heightTextEditingController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    icon: Image.asset(
                      'assets/free-icon-height-1417225.png',
                      width: 24,
                      color: Colors.white,
                    ),
                    hintText: '키',
                    suffixIcon: heightText.isEmpty
                        ? null
                        : GestureDetector(
                            child: Icon(
                              Icons.cancel,
                              color: Colors.purple[200],
                            ),
                            onTap: () {
                              setState(() {
                                _heightTextEditingController.clear();
                                heightText = '';
                              });
                            },
                          ),
                  ),
                ),
              )),
              // width 텍스트필드
              Center(
                  child: SizedBox(
                height: 100,
                width: 300,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '몸무게를 입력하세요';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    setState(() {
                      weightText = text;
                    });
                  },
                  controller: _weightTextEditingController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    icon: Icon(Icons.scale),
                    hintText: '몸무게',
                    suffixIcon: weightText.isEmpty
                        ? null
                        : GestureDetector(
                            child: Icon(
                              Icons.cancel,
                              color: Colors.purple[200],
                            ),
                            onTap: () {
                              setState(() {
                                _weightTextEditingController.clear();
                                weightText = '';
                              });
                            },
                          ),
                  ),
                ),
              )),
              // result 버튼
              AnimatedOpacity(
                opacity: (heightText.isNotEmpty && weightText.isNotEmpty)
                    ? 1.0
                    : 0.0,
                duration: Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.push(Uri(
                            path: '/manresult',
                            queryParameters: {
                              'height': _heightTextEditingController.text,
                              'weight': _weightTextEditingController.text
                            },
                          ).toString());
                        }
                      },
                      child: Text('남자'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.push(Uri(
                            path: '/womanresult',
                            queryParameters: {
                              'height': _heightTextEditingController.text,
                              'weight': _weightTextEditingController.text
                            },
                          ).toString());
                        }
                      },
                      child: Text('여자'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
