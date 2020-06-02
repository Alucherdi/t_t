import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Home()
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  int editStatus = 0;

  Widget buildButton() {
    List<String> titles = <String> [
      "Editar", "Ok"
    ];

    List callbacks = [
      () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Editando"),
        ));
      },

      () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Llamando al servicio"),
        ));
      }
    ];
    
    return GestureDetector(
      onTap: () {
        callbacks[this.editStatus]();
        this.setState(() { 
          this.editStatus += this.editStatus < 1 ?
            1 :
            -this.editStatus;
        });
      },
      child: Container(
        width: 300,
        height: 300,
        child: Text(titles[this.editStatus]),
        decoration: BoxDecoration(
          color: Colors.blue[100]
        ),
      )
    );
  }

  Widget buildTextfield(){
    List<Widget> a = <Widget>[
      TextField , Text
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: buildButton()
      )
    );
  }
}