// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextformfieldWidget extends StatefulWidget {
  final String hintText;
  final Icon inputIcon;
  final Function validator;

  const TextformfieldWidget({
    Key? key,
    required this.hintText,
    required this.inputIcon,
    required this.validator,
  }) : super(key: key);

  @override
  State<TextformfieldWidget> createState() => _TextformfieldWidgetState();
}

class _TextformfieldWidgetState extends State<TextformfieldWidget> {
  TextEditingController _textEditingController = TextEditingController();
  String textFormFieldText = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (text) {
          setState(() {
            textFormFieldText = text;
          });
        },
        controller: _textEditingController,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          icon: widget.inputIcon,
          hintText: widget.hintText,
          suffixIcon: textFormFieldText.isEmpty
              ? null
              : GestureDetector(
                  child: Icon(
                    Icons.cancel,
                    color: Colors.purple[200],
                  ),
                  onTap: () {
                    setState(() {
                      _textEditingController.clear();
                      textFormFieldText = '';
                    });
                  },
                ),
        ),
      ),
    );
  }
}
