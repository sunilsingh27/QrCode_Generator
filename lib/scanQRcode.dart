import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResult ='Scanned Data will Appear here';
  Future<void> scanQR()async{

    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'cancel', true, ScanMode.QR);
      if (!mounted) return;

      if (qrCode == '-1') {
        setState(() {
          qrResult = "Failed to read QR code";
        });
      } else {
        setState(() {
          this.qrResult = qrCode.toString();
        });
      }
    } on PlatformException {
      setState(() {
        qrResult = "Failed to read QR code";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('QR Code Scanner '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text('$qrResult',style: TextStyle(color: Colors.black),),
            SizedBox(height: 30,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),

                    fixedSize:Size(200, 85)),
                onPressed: scanQR, child: Text('Scan Code', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
