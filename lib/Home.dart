import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/widget/Button.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String equation = "";
  double result = 0;

  void numClick(String s) {
    setState(() {
      equation += s;
    });
  }

  void equate() {
    if (equation.length == 0) {
      return;
    }

    String parsedEquation;
    parsedEquation = equation.replaceAll('×', '*');
    parsedEquation = parsedEquation.replaceAll('÷', '/');
    parsedEquation = parsedEquation.replaceAll('−', '-');

    Parser p = Parser();
    Expression exp = p.parse(parsedEquation);
    ContextModel cm = ContextModel();

    setState(() {
      result = exp.evaluate(EvaluationType.REAL, cm);
      equation = (result.round() == result)
          ? result.toInt().toString()
          : result.toStringAsFixed(3);
    });
  }

  void remove() {
    setState(() {
      equation = equation.length == 0
          ? equation
          : equation.substring(0, equation.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        //Kolon, Container dan farklı olarak children parametresine sahiptir. Children parametresi <Widget>[,,,] alır. Bu da kolon içerisine bir çok widget eklenebileceği anlamına gelir. Widgetlar üst üste ekleniyor gibi sonuç verir.
        //İki önemli parametresi vardır. mainAxisAligment ve crosAxisAligment
        // mainAxisAligment: Column içerisindeki widgetları yukarıdan aşağıya sıralar
        // crossAxisAligment: Sağdan-sola hizalar.
        child: Column(
          //Sütünlar arasındaki boşluklar
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Expanded: Benzer widgetlerden birini mümkün olan alana esnetmek istersek kullanırız.Örnek: Column widgetın içerisinde bir sürü children widgeti sahibiz. Bu children widgetlerden bazılarını kalan alanlara esneyerek genişlemesini istiyorsak expanded içine alıp genişletilir.
            Expanded(child: Container()),
            //Container: İçerisine nesneleri yerleştirebileceğimiz bir kutu. Bu kutunun sınırlarını belirleyebileceğimiz bir alan sağlar. Dilediğimiz şekilde şekillendiririz. decoration parametresi ile kenarlarını oval yapabilir, resim ekleyebilirsin...
            Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //Row: Satır, widgetları yatay olarak yapılandırır.
                    //Row da mainAxisAligment: sağdan-sola; crossAxisAlignment: yukarıdan-aşağı
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          equation,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        )),
                        IconButton(
                            icon: Icon(Icons.backspace_outlined),
                            onPressed: remove,
                            padding: EdgeInsets.fromLTRB(35, 0, 35, 0))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Text(
                          (result.round() == result)
                              ? result.toInt().toString()
                              : result.toStringAsFixed(3),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.montserrat(
                              fontSize: 50, fontWeight: FontWeight.w200)),
                    )
                  ],
                )),
            Container(padding: EdgeInsets.all(10), child: Divider()),
            Row(
              //soldan-sağa
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(value: '7', funct: numClick),
                Button(value: '8', funct: numClick),
                Button(value: '9', funct: numClick),
                Button(value: '÷', funct: numClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(value: '4', funct: numClick),
                Button(value: '5', funct: numClick),
                Button(value: '6', funct: numClick),
                Button(value: '×', funct: numClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(value: '1', funct: numClick),
                Button(value: '2', funct: numClick),
                Button(value: '3', funct: numClick),
                Button(value: '−', funct: numClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(value: '0', funct: numClick),
                Button(value: '.', funct: numClick),
                Button(value: '=', funct: equate),
                Button(value: '+', funct: numClick)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
