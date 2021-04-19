import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
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

  var myJson = {};
  var passportPic, selfie;

  //// =========== FROM WENDY REMOTE ===========///////
  PickedFile passport;

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

  //// =========== FROM WENDY REMOTE ===========///////
  _openGalleryPassport(BuildContext context) async {
    var passpic = await _picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      passport = passpic;
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

  //// =========== FROM WENDY REMOTE ===========///////
  Future<void> _showChoiceDialogPassport(BuildContext context) {
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
                      _openGalleryPassport(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                ],
              ),
            ),
          );
        });
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

  // Upload file to Firebase
  Future uploadImageToFirebase(
      BuildContext context, PickedFile _imageFile) async {
    String fileName = basename(_imageFile.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    StorageUploadTask uploadTask =
        firebaseStorageRef.putFile(File(_imageFile.path));
    return Image.file(File(imageFile.path), width: 100, height: 100);
  }

  Widget _decidePassportView() {
    if (passport == null) {
      return Text("No file selected!");
    } else {
      print(passport.path);
      return Image.file(File(passport.path), width: 100, height: 100);
    }
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("No image selected!");
    } else {
      print(imageFile.path);
      return Image.file(File(imageFile.path), width: 200, height: 200);
    }
  }

  Future uploadPassportToFirebase(BuildContext context) async {
    String fileName = basename(passport.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('passports/$fileName');
    StorageUploadTask uploadTask =
        firebaseStorageRef.putFile(File(passport.path));
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Verification Information"),
      ),
      body: SingleChildScrollView(
        child: Stack(
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
              child: Form(
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
                    child: Row(
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
                            _showChoiceDialogPassport(context);
                            uploadPassportToFirebase(context);
                          },
                          child: Text(
                            'Upload Passport',
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  _decidePassportView(),

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
                        if (passport == null || imageFile == null) {
                          // Put your code here which you want to execute when Text Field is Empty.
                          final snackBar = SnackBar(
                            content: Text('All Textfield data are required'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RequestLoan(data: myJson);
                          }));
                        }
                        myJson = {
                          ...widget.data,
                          //   'passportPic':passport,
                          // 'selfie':imageFile
                        };
                        print(myJson);
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
            ),
            //BottomNavigation(),
          ],
        ),
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
