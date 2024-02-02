import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrgenerator/create_qr.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrgenerator/scanQRcode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        hintColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: QRGenerator(),
    );
  }
}

class QRGenerator extends StatefulWidget {
  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(child: Text('QR Code Generator')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(
                  child: Center(
                    child: Text('Create or Scan QR Code easily',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  )


            ),
            
            SizedBox(height: 35),


            Container(
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),

                    fixedSize:Size(200, 85)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> generateqr()));
                  setState(() {

                  });
                },
                child: Text('Create QR Code',
                style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold )),

              ),
            ),
            SizedBox(height: 35),

            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
                    fixedSize:Size(200, 85)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ScanQRCode()));

                  setState(() {

                  });
                },
                child: Text('Scan QR Code',
                    style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold )),

              ),
            ),

          ]

        ),
      ),
    );
  }
}
