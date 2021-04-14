import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:summative/controllers/Constants.dart';

import 'RequestLoan.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RequestLoanFormThree extends StatefulWidget {
  final data;

  RequestLoanFormThree({Key key, this.data}) : super(key: key);

  @override
  _RequestLoanFormThreeState createState() => _RequestLoanFormThreeState();
}

class _RequestLoanFormThreeState extends State<RequestLoanFormThree> {
  // For the file upload (Passport)
  String _fileName;

  // When uploading a single file
  String _path;

  //Uploading multiple files
  Map<String, String> _paths;

  // Storing the file extension
  String _extension;

  // Check that the file path is present
  bool _loadingPath = false;

  // check if multiple files have been selected
  bool _multiPick = false;

  //Check for valid formatting
  bool _hasValidMime = false;

  // File type
  FileType _pickingType;

  // Listening for the file to upload(name and extension)
  TextEditingController _controller = new TextEditingController();

  PickedFile imageFile;
  PickedFile passportFile;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    // The view's state is changed once the file is retrieved
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, fileExtension: _extension);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null
                ? _paths.keys.toString()
                : '...';
      });
    }
  }

  _openFileExplorerPassport(BuildContext context) async {
    var passport = await _picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      passportFile = passport;
    });
    // Navigator.of(context).pop();
  }

  _openGallery(BuildContext context) async {
    var picture = await _picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });

    // Popping off the gallery after selecting an image
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await _picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a choice!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("No image selected!");
    } else {
      print(imageFile.path);
      return Image.file(File(imageFile.path), width: 200, height: 200);
    }
  }

  Widget _decidePassportView() {
    if (passportFile == null) {
      return Text("No file selected!");
    } else {
      print(passportFile.path);
      return Text(passportFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Verification Information"),
      ),
      body: Stack(
        children: <Widget>[
          //  ===========  I think we should also leave comments in our code to indicate what different items
          // whether widgets or functions do ========== //
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-4.0, 0.0),
                end: Alignment(0.0, 1.5),
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                  kGradientColor1,
                  kGradientColor2,
                  kGradientColor3,
                  kGradientColor4,
                  kGradientColor4
                ],
                stops: [0.0, 0.3, 0.2, 0.3, 0.63, 0.63, 0.0],
              ),
            ),
            // Inserting the header widget here
            // child: header,
          ),

          // The rest of the white body
          Container(
            margin: EdgeInsets.only(top: 70.0),
            padding: EdgeInsets.only(top: 1.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Form(
                    child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Padding(padding: EdgeInsets.only(bottom: 20)),

                    // Form Input Widgets
                    Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Passport *',
                            style: TextStyle(fontSize: 18, color: textColor),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.upload_rounded),
                                SizedBox(
                                  width: 15,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white, // background
                                    onPrimary: Colors.white70, // foreground
                                  ),
                                  onPressed: () {
                                    _openFileExplorerPassport(context);
                                  },
                                  child: Text(
                                    'Upload Passport',
                                    style: TextStyle(color: textColor),
                                  ),
                                ),
                              ],
                            ),
                            _decidePassportView(),
                          ],
                        )),
                    SizedBox(
                      height: 60,
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Take a Selfie *',
                            style: TextStyle(fontSize: 18, color: textColor),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '(Note: Picture must be in portrait)',
                            style: TextStyle(fontSize: 16, color: textColor),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 55.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.camera,
                              size: 80.0,
                            ),
                            onPressed: () {
                              _showChoiceDialog(context);
                            },
                          ),
                        )),

                    SizedBox(
                      height: 40,
                    ),

                    _decideImageView(),

                    // Padding(
                    //   padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       hintText: 'Kindly verify mobile number for transaction',
                    //       labelText: 'Kindly verify mobile number for transaction',
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 50),

                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RequestLoan();
                            // return RequestLoan(data: myJson);
                          }));
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        elevation: 0.0,
                        color: kPrimaryColor2,
                        padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )
                  ],
                )),
              ],
            ),
          ),
          //BottomNavigation(),
        ],
      ),
    );
  }
}

// Header with the Seeka name
Widget header = Container(
  margin: EdgeInsets.symmetric(vertical: 70.0),
  child: Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "     Employment Information",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ],
                )),
          ],
        ),
      ),
    ],
  ),
);
