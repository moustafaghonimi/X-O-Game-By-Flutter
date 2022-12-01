import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  String text = '';
  int index;
Function callBack;
  ItemButton(this.text,this.index,this.callBack);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.indigo),
          ),
          onPressed: () {
            callBack(index);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 35),
          ),
        ),
      ),
    );
  }
}
