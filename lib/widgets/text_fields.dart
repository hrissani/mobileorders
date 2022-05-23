
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {

  String hint1;
  String helperText;
  bool noerrore;
  TextEditingController textEditingController;
  // VoidCallback erroreField;
  TextFieldCustom({ 
    Key? key , 
    required this.hint1,
    required this.helperText,
    required this.textEditingController,
    required this.noerrore,
    // required this.erroreField
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color:noerrore ? Colors.grey : Colors.red ),
              borderRadius:const BorderRadius.all(Radius.circular(12))
            ),
            // icon: Icon(Icons.login),
            hintText: hint1,
            helperText: helperText,
        ),
        validator: (value){
          // if(value != null)
          //   if (value.isEmpty) return erroreField();
        }
      ),
    );
  }
}