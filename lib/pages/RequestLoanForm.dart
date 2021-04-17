import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:summative/model/RequestLoan.dart';
import 'RequestLoanForm2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RequestLoanForm extends StatefulWidget {
  @override
  _RequestLoanFormState createState() => _RequestLoanFormState();
}

class _RequestLoanFormState extends State<RequestLoanForm> {
  // Creating variables for storing the position and the address
  Position _currentPosition;
  String _currentAddress;


  // Populating the list of personal information
  final List<PersonalInformation> personalInfoList = [
    PersonalInformation("Wendy", "Essuman", "w.essuman@alustudent.com",
        25076543219, "Kigali, Rwanda"),
    PersonalInformation("David", "Masoperh", "d.masoperh@alustudent.com",
        25078123455, "Nairobi, Kenya"),
    PersonalInformation("Christine", "Wasike", "c.wasike@alustudent.com",
        250789654679, "Kampala, Uganda")
  ];

  // Controllers to collect the user input
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();

    var myJson = {};
    var fName, lName,email,phoneNumber;

  // Instantiating the geolocator class
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    // location = _currentAddress;
  }


  // Getting the location in form of coordinates(Latitudes and Longitudes)
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      // Reference to the address function
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  // Getting the address from coordinates
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress =
            "${place.locality}. ${place.postalCode},${place.country} ";
      });
    } catch (e) {
      print(e);
    }
  }

  // Personal Information

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text("Personal Information"),
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
            child: Form(
                child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10)),
                Padding(padding: EdgeInsets.only(bottom: 20)),

                // Form Input Widgets

                // First name
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextFormField(
                    controller: firstNameController,
                    onChanged: (value){
                      fName = value;
                    },

                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      hintText: 'First name',
                      labelText: 'First name *',
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Last name
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextFormField(
                    controller: lastNameController,
                    onChanged: (value){
                      lName = value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle_outlined),
                      contentPadding: EdgeInsets.only(top: 5),
                      hintText: 'Last name',
                      labelText: 'Last name *',
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Email
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextFormField(
                    controller: emailController,
                    onChanged: (value){
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Email',
                      labelText: 'Email *',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter your email address';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Mobile number
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextFormField(
                    controller: phoneNumberController,
                    onChanged: (value){
                      phoneNumber = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: 'Mobile number',
                      labelText: 'Mobile number *',
                    ),
                  ),
                ),

                //Location
                // Displaying the address on the screen
                SizedBox(height: 30),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                          ),
                          padding: EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Location',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                        if (_currentPosition != null &&
                                            _currentAddress != null)
                                          Text(_currentAddress,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2),

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),

                // Button
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    onPressed: () {

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RequestLoanFormTwo();
                      }));
                      myJson = {'fName': fName,
                        'lName':lName,
                        'email':email,
                      'phoneNumber':phoneNumber,
                      'location':_currentAddress};
                      print(myJson);
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) {
                      //       return RequestLoanFormTwo();
                          return RequestLoanFormTwo(data : myJson);
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "     Personal Information",
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

