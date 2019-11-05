import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
home:Home(),
));
}
class Home  extends StatefulWidget {
  @override

  _HomeState createState() => _HomeState();
}

class _HomeState  extends State<Home> {
  TextEditingController weigthController  = TextEditingController();
  TextEditingController heigthController  = TextEditingController();
 GlobalKey<FormState> _formkey  = GlobalKey<FormState>();
 String infotext=  "Informe seus dados";
 void _resertField(){

   weigthController.text = "";
   heigthController.text = "";
      setState(() {
    infotext = "Informe seus dados"; 
   });
 }
 void _calculate()
 {
   setState((){
 double weight =  double.parse(weigthController.text);
    double height =  double.parse(heigthController.text)/ 100;
    
    double imc  =  weight / ( height* height);
    if(imc < 18.6)
    {
         infotext =  "Abaixo do Peso(${imc.toStringAsPrecision(4)})";
    }else if (imc >= 18.6 && imc< 24.9)
    {
       infotext =  "Peso ideal(${imc.toStringAsPrecision(4)})";
    }else if (imc >= 24.9 && imc< 29.9)
    {
       infotext =  "Levemente Acima do Peso(${imc.toStringAsPrecision(4)})";
    }else if (imc >= 29.9 && imc< 34.9)
    {
       infotext =  "Obsidade Grau I(${imc.toStringAsPrecision(4)})";
    }else if (imc >= 32.9 && imc< 39.9)
    {
       infotext =  "Obesidade Grau II(${imc.toStringAsPrecision(4)})";
    }else if (imc >= 40)
    {
       infotext =  "Obesidade Grau III(${imc.toStringAsPrecision(4)})";
    }



   });
  //  setState(() {
  //   infotext = "Informe seus dados"; 
  //  });
   
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        centerTitle: true,
       title: Text(
         "Calculadora IMC"         
       ),
       backgroundColor: Colors.green,
       actions: <Widget>[
         IconButton(icon: Icon(Icons.refresh),
         onPressed: _resertField)
       ],
      ),
      backgroundColor:Colors.white ,
      body:SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child:Form(
          key:_formkey,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      
children: <Widget>[
  Icon(Icons.person_outline, size: 128.0, color: Colors.green),
  TextFormField(keyboardType: TextInputType.number,
  decoration: InputDecoration(
labelText: "Peso KG",
labelStyle: TextStyle(color: Colors.green),


  ),
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.green,
    fontSize: 25.8
  ),
  controller:weigthController,
  validator: (value){
    if(value.isEmpty)
    {
      return "Insira seu Peso";
    }
  },
  ),
  TextFormField(keyboardType: TextInputType.number,
  decoration: InputDecoration(
labelText: "Altura CM",
labelStyle: TextStyle(color: Colors.green),


  ),
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.green,
    fontSize: 25.8
  ),
  controller:heigthController,
  validator: (value){
    if(value.isEmpty)
    {
      return "Insira sua Altura";
    }
  },
  
  ),
 Padding(

   padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
   
   child:
    Container(
    height: 50.0,
     child: RaisedButton(
    onPressed: (){
if(_formkey.currentState.validate()){
_calculate();
}
    

    },
    child: Text("Calcular",
    style: TextStyle(color: Colors.white, fontSize: 25.0)
    ,
    ),
    color: Colors.green,

    )

  
,
   
 ), 
    
 ),
 Text(
  infotext,
   textAlign: TextAlign.center,
   style: TextStyle(
     color: Colors.red,fontSize: 25.0
   ),
 ),
],

      ) ,
        ),
      ),
    );
  }
}
