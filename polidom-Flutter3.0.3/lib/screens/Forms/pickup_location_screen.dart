import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:geocoder/geocoder.dart' as geoc;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart'
    as PermissionHandler;
import 'package:provider/provider.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

import '../../Widgets/flatBtn.dart';
import '../../providers/location_provider.dart';

class SelectExactLocationScreen extends StatefulWidget {
  static String routeName = '/address-selection';

  @override
  _SelectExactLocationScreenState createState() =>
      _SelectExactLocationScreenState();
}

class _SelectExactLocationScreenState extends State<SelectExactLocationScreen> {
  GoogleMapController? mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Map<String, Marker> _markers = {};
  final Completer<GoogleMapController> _controller = Completer();
  String _currentStreetAddress = '';
  // geoc.Address _currentFullAddress;
  LatLng? _currentCoordinates;
  bool _visible = true;
  GoogleMap? _map;
  Future<bool>? locationPermissionFuture;

  @override
  void initState() {
    super.initState();
    locationPermissionFuture = _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    _map = GoogleMap(
      onTap: _onTap,
      onMapCreated: _onMapCreated,
      onCameraMove: _onCameraMove,
      onCameraIdle: _onCameraIdle,
      initialCameraPosition:
          CameraPosition(target: LatLng(18.476443, -69.957542), zoom: 20.0),
      markers: Set<Marker>.of(_markers.values),
    );

    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: FutureBuilder(
          future: locationPermissionFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Center(
                child: CircularProgressIndicator(),
              );

            return SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.85,
                        child: _map,
                      ),
                      _buildAddressDescription(),
                      _buildConfirmAddressButton(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 120),
                    // child: _buildIndicationsButton(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    // child: SearchMapPlaceWidget(
                    //   icon: Icons.location_on_rounded,
                    //   language: 'es-419',
                    //   iconColor: Colors.red,
                    //   strictBounds: true,
                    //   // hasClearButton: true,
                    //   // placeType: PlaceType.address,
                    //   placeholder: ('EnterTheLocation'),
                    //   apiKey: 'AIzaSyD3lVE1KJrbuqq6LCIVsAGT8svVoeaIl4U',
                    //   onSelected: _onPlaceSelected,
                    // ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Future _onCameraIdle() async {
    if (_currentCoordinates != null) {
      await _getAddress(_currentCoordinates!);
    }
  }

  Future _onPlaceSelected(Place place) async {
    Geolocation? geolocation = await place.geolocation;

    await mapController!
        .animateCamera(CameraUpdate.newLatLng(geolocation!.coordinates));
    await mapController!
        .animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
  }

  Future _onMapCreated(controller) async {
    setState(() {
      mapController = controller;
      _controller.complete(controller);
    });

    final Position currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    await _moveToPosition(
        LatLng(currentLocation.latitude, currentLocation.longitude));

    await _getLocation();
  }

  void _onCameraMove(CameraPosition cameraPosition) async {
    setState(() {
      final geocoding =
          ('${cameraPosition.target.latitude}, ${cameraPosition.target.longitude}');
      _currentCoordinates = cameraPosition.target;
      final marker = Marker(
          visible: true,
          markerId: MarkerId(cameraPosition.target.latitude.toString() +
              cameraPosition.target.longitude.toString()),
          position: LatLng(
              cameraPosition.target.latitude, cameraPosition.target.longitude),
          infoWindow: InfoWindow(title: geocoding),
          draggable: false);

      _markers = {};
      _markers['Current_Location'] = marker;
    });
  }

  Future _onTap(tapped) async {
    final geocoding = ('${tapped.latitude}, ${tapped.longitude}');
    await _moveToPosition(tapped);

    setState(() {
      _markers.clear();
      final marker = Marker(
          visible: true,
          markerId: MarkerId(
              tapped.latitude.toString() + tapped.longitude.toString()),
          position: LatLng(tapped.latitude, tapped.longitude),
          infoWindow: InfoWindow(title: geocoding),
          draggable: false);

      _markers['Current_Location'] = marker;
    });
  }

  // Widget _buildIndicationsButton() {
    //TODO instrucciones
    // final button = FlatButton.icon(
    //   color: Colors.blue,
    //   textColor: Colors.white,
    //   onPressed: () {
    //     setState(() {
    //       _visible = false;
    //     });
    //   },
    //   icon: Icon(Icons.close),
    //   label: Text(
    //     'Seleccione su direccion',
    //     style: TextStyle(fontSize: 18),
    //   ),
    //   shape: RoundedRectangleBorder(),
    // );

    // return Container(
    //   child: _visible ? button : Text(''),
    // );
  // }

  Widget _buildAddressDescription() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.playlist_add_check_rounded,
                      color: Colors.red)),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  _currentStreetAddress,
                  style: TextStyle(
                      fontSize: 20, color: Colors.red.withOpacity(0.5)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmAddressButton() {
    return Container(
      height: 40,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(.5),
          borderRadius: BorderRadius.circular(20)),
      child: FlatButton(
        onPressed: () {
          _onConfirmAddress();
        },
        child: Text(
          'Seleccionar',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Future _onConfirmAddress() async {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    try {
      // bool wasSaved =
      //     await locationProvider.saveAddress(_currentFullAddress.toMap());
      // if (wasSaved) {
      //   Navigator.of(context).pop();
      // } else {
      //   //TODO show dialog
      //   print('NotAbleToSave');
      // }
    } on PlatformException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  Future _getAddress(LatLng pos) async {
    // final coordinates = geoc.Coordinates(pos.latitude, pos.longitude);
    // final List<geoc.Address> addresses =
    //     await geoc.Geocoder.local.findAddressesFromCoordinates(coordinates);
    // geoc.Address first = addresses.first;
    // if (addresses != null && addresses.isNotEmpty) {
    //   setState(() {
    //     _currentStreetAddress = _getAddressLocation(first);
    //     _currentFullAddress = first;
    //   });
    // }

    return "";
  }

  // String _getAddressLocation(geoc.Address address) {
  //   if (address.thoroughfare == null || address.subThoroughfare == null) {
  //     return '${_getAddressPart(address.locality)}';
  //   } else {
  //     return '${address.thoroughfare} ${address.subThoroughfare}, ${address.locality}';
  //   }
  // }

  String _getAddressPart(value) {
    if (value == null) {
      return '';
    } else {
      return value;
    }
  }

  Future<bool> _getLocation() async {
    bool gotLocation = false;
    // PermissionsUtil.runtimePermissionWorkflow(
    //     permission: PermissionHandler.Permission.locationWhenInUse,
    //     onDenied: () async {
    //       bool? openSettings = await showDialog<bool>(
    //         context: context,
    //         builder: (context) => AlertDialog(
    //           title: Text(('locationPermissionDeniedTitle')),
    //           content: Text(('locationPermissionDeniedContent')),
    //           actions: [
    //             TextButton(
    //               onPressed: () => Navigator.of(context).pop(false),
    //               child: Text(('locationPermissionDeniedCancel')),
    //             ),
    //             TextButton(
    //               onPressed: () => Navigator.of(context).pop(true),
    //               child: Text(('locationPermissionDeniedOpenSettings')),
    //             ),
    //           ],
    //         ),
    //       );

    //       if (openSettings != null && openSettings)
    //         PermissionHandler.openAppSettings();
    //     },
    //     showRationale: () async {
    //       bool? requestPermission = await showDialog<bool>(
    //         context: context,
    //         builder: (context) => AlertDialog(
    //           title: Text(('locationPermissionRationaleTitle')),
    //           content: Text(('locationPermissionRationaleContent')),
    //           actions: [
    //             TextButton(
    //               onPressed: () => Navigator.of(context).pop(false),
    //               child: Text(('locationPermissionRationaleDeny')),
    //             ),
    //             TextButton(
    //               onPressed: () => Navigator.of(context).pop(true),
    //               child: Text(('locationPermissionRationaleAllow')),
    //             ),
    //           ],
    //         ),
    //       );

    //       if (requestPermission != null)
    //         return requestPermission;
    //       else
    //         return false;
    //     },
    //     onGranted: () async {
    //       final currentLocation = await Geolocator.getCurrentPosition(
    //           desiredAccuracy: LocationAccuracy.best);

    //       final geocoding =
    //           ('${currentLocation.latitude}, ${currentLocation.longitude}');

    //       setState(() {
    //         _markers.clear();
    //         MarkerId markerId = MarkerId(currentLocation.latitude.toString() +
    //             currentLocation.longitude.toString());
    //         final marker = Marker(
    //             visible: true,
    //             markerId: markerId,
    //             position:
    //                 LatLng(currentLocation.latitude, currentLocation.longitude),
    //             infoWindow: InfoWindow(title: geocoding),
    //             draggable: true);
    //         _markers['Current_Location'] = marker;
    //       });
    //       gotLocation = true;
    //     });

    return gotLocation;
  }

  // Future _getLocation() async {
  //   final currentLocation = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.best);

  //   final geocoding =
  //       ('${currentLocation.latitude}, ${currentLocation.longitude}');

  //   setState(() {
  //     _markers.clear();
  //     MarkerId markerId = MarkerId(currentLocation.latitude.toString() +
  //         currentLocation.longitude.toString());
  //     final marker = Marker(
  //         visible: true,
  //         markerId: markerId,
  //         position: LatLng(currentLocation.latitude, currentLocation.longitude),
  //         infoWindow: InfoWindow(title: geocoding),
  //         draggable: true);
  //     _markers['Current_Location'] = marker;
  //   });
  // }

  Future _moveToPosition(LatLng pos) async {
    final GoogleMapController mapController = await _controller.future;
    if (mapController == null) return;

    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(pos.latitude, pos.longitude),
      zoom: 16,
    )));
  }
}
