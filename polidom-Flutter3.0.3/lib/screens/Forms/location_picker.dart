import 'package:flutter/material.dart';

class PickupLocationScreen extends StatefulWidget {
  static String routeName = 'locationSelector';
  const PickupLocationScreen({Key? key}) : super(key: key);

  @override
  _PickupLocationScreenState createState() => _PickupLocationScreenState();
}

class _PickupLocationScreenState extends State<PickupLocationScreen> {
  @override
  Widget build(BuildContext context) {
    // SimpleLocationResult _selectedLocation;
    return Scaffold(
        appBar: AppBar(title: Text('Selecciona la direccion')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),

              // The button that opens the SimpleLocationPicker in display ONLY mode.
              // This opens the SimpleLocationPicker to display a specific location on the map with a marker.
              RaisedButton(
                child: Text("Display a location"),
                onPressed: () {
                  double latitude =0;//= _selectedLocation != null
                      // ? _selectedLocation.latitude
                      // : SLPConstants.DEFAULT_LATITUDE;
                  double longitude =0;//= _selectedLocation != null
                      // ? _selectedLocation.longitude
                      // : SLPConstants.DEFAULT_LONGITUDE;


                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SimpleLocationPicker(
                  //               initialLatitude: latitude,
                  //               initialLongitude: longitude,
                  //               appBarTitle: "Display Location",
                  //               displayOnly: true,
                  //             )));
                },
              ),
              SizedBox(height: 50),

              // The button that opens the SimpleLocationPicker in picker mode.
              // This opens the SimpleLocationPicker to allow the user to pick a location from the map.
              // The SimpleLocationPicker returns SimpleLocationResult containing the lat, lng of the picked location.
              RaisedButton(
                child: Text("Pick a Location"),
                onPressed: () {
                  double latitude =0;//= _selectedLocation != null
                      // ? _selectedLocation.latitude
                      // : SLPConstants.DEFAULT_LATITUDE;
                  double longitude =0;//= _selectedLocation != null
                      // ? _selectedLocation.longitude
                      // : SLPConstants.DEFAULT_LONGITUDE;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SimpleLocationPicker(
                  //               initialLatitude: latitude,
                  //               initialLongitude: longitude,
                  //               appBarTitle: "Select Location",
                  //             ))).then((value) {
                  //   if (value != null) {
                  //     setState(() {
                  //       _selectedLocation = value;
                  //     });
                  //   }
                  // });
                },
              ),

              SizedBox(height: 50),
              // Displays the picked location on the screen as text.
              // _selectedLocation != null
              //     ? Text(
              //         'SELECTED: (${_selectedLocation.latitude}, ${_selectedLocation.longitude})')
              //     : Container(),
            ],
          ),
        ));
  }
}
