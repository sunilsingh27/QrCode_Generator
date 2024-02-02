import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class generateqr extends StatefulWidget {
  const generateqr({super.key});

  @override
  State<generateqr> createState() => _generateqrState();
}

class _generateqrState extends State<generateqr> {
  TextEditingController urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(child: Text("Generator QR")),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (urlController.text.isNotEmpty)
                QrImageView(
                  data: urlController.text,
                  size: 200,
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: urlController,
                    decoration: InputDecoration(
                        hintText: 'Enter your data',
                        border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'Enter your data'),
                  )),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize: Size(200, 85)),
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Genrate QR Code',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
            ],
          ),
        ),
      ),
    );
  }
}
