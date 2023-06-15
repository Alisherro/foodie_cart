import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../icons/svg_icons.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=context.watch<AppBarProvider>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.string(SvgIcons.svgLocation, width: 22),
        ),
        SizedBox(width: 7),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${provider.currentAddress ?? "Санкт-Петербург"}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Text(
              // '12 Августа, 2023',
              DateFormat('dd MMMM yyyy', 'ru_RU').format(DateTime.now()),

              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            )
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
            'https://s3-alpha-sig.figma.com/img/738e/6e77/a92971e6075b85d18be0de93205d90cb?Expires=1687737600&Signature=CviOR2T3fFb157NIU9razzN2LfobSUjCGyZ76AI506SnPxZn8ec2WgO7251cjwYSENykkTl7Y-K~V7jEMXnh3r072fBmyJUj7ptB2vyHkOTg3HKAMS0GhSorPbmVem7~0jPn4kKk5Mrcgapkf-GaUVZTvmMc5~pBZCfjRkysIkLPOxj8f2ArUqkRW1eCBNsbxEqoJfvnQMOhcsnMZsURMznUrYKRETyVxdbL0lo2YEv7ZWuIUfSu8LEFDpx2t60IIijSwV9bQ9NU2DDjTWncVNyHr5HmElMiejKwCXexvaSCYQJXdCkBectc0JW0-aaFjfgqbcPrbvgZ53Q~K8QzBg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
          ),
        )
      ],
    );
  }
}

class AppBarProvider extends ChangeNotifier {
  AppBarProvider(BuildContext context) {
    _getCurrentPosition();
    context=context;
  }

  String? currentAddress;
  Position? _currentPosition;
  late BuildContext context;

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
    notifyListeners();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude,
            localeIdentifier: 'ru_RU')
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress = '${place.locality}';
      notifyListeners();
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
