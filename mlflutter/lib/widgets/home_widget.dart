import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mlflutter/widgets/prediction.dart';
import 'dart:io';

class HomeWidget extends StatefulWidget {
  //const HomeWidget({ Key? key }) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final picker = ImagePicker();
  String pred;
  String prob;
  File image;
  bool img_present = false;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Card(
              child: Center(
                child: img_present
                    ? Image.file(
                      image,
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 1,
                      fit: BoxFit.fitWidth,
                    )
                    : Text(
                        "Upload Image",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 30,
                          fontFamily:
                              GoogleFonts.satisfy(fontSize: 20).fontFamily,
                        ),
                      ),
              ),
              elevation: 4,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          OutlinedButton(
            onPressed: () async {
              final pickedimage = await picker.pickImage(
                  source: ImageSource.camera,
                  //maxWidth: MediaQuery.of(context).size.width * 1,
                  //maxHeight: MediaQuery.of(context).size.width * 0.35,
                  imageQuality: 100);
              setState(() {
                if (pickedimage != null) {
                  img_present = true;
                  image = File(pickedimage.path);
                }
              });
            },
            child: Icon(Icons.camera_alt, color: Colors.teal[600]),
            style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(14),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Icon(
              Icons.image,
              color: Colors.teal[600],
            ),
            style: OutlinedButton.styleFrom(
              //backgroundColor: Colors.grey[200],
              shape: CircleBorder(),
              padding: EdgeInsets.all(14),
            ),
          ),
        ]),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Prediction(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      ],
    );
  }
}
