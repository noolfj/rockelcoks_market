import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rockelcoks_market/screens/main/delivery/picked_address_success_screen.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';
import 'package:rockelcoks_market/utils/custom_Snackbar.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Map<String, dynamic>> points = [
    {
      "title": "улица К. Хучанди 163",
      "lat": 40.283,
      "lng": 69.622
    },
    {
      "title": "улица Ходжентская 96",
      "lat": 40.275,
      "lng": 69.622
    },
    {
      "title": "улица 80-л. Душанбе 34",
      "lat": 40.280,
      "lng": 69.588
    }
  ];

  int? selectedIndex; 

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(40.283, 69.622),
            initialZoom: 12,
            onTap: (tapPosition, point) {
              setState(() {
                selectedIndex = null;
              });
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.rockelcoks_market',
            ),
            MarkerLayer(
              markers: points.asMap().entries.map((entry) {
                final index = entry.key;
                final p = entry.value;
                final isSelected = selectedIndex == index;
                return Marker(
                  point: LatLng(p['lat'], p['lng']),
                  width: 120,
                  height: 120,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      showCustomSnackBar(
                        context,
                        'Вы выбрали: ${p['title']}',
                        Colors.green,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(6),
  
                          ),
                          child: Text(
                            p['title'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Image.asset(
                          isSelected
                              ? 'assets/icons/ic_check.png'
                              : 'assets/icons/ic_location.png',
                          width: isSelected ? 56 : 64,
                          height: isSelected ? 56 : 64,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),

        Positioned(
          top: 40,
          right: 16,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedIndex != null 
                  ? Colors.green 
                  : Colors.grey.withOpacity(0.7),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            onPressed: () {
              if (selectedIndex == null) {
                showCustomSnackBar(
                  context,
                  'Сначала выберите пункт выдачи!',
                  Colors.grey,
                );
              } else {
                Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => PickedAddressSuccessScreen()),
                 );
              }
            },
            child: Text(
              'Сохранить',
              style: AppStyles.getAppTextStyle(
                 color: Colors.white,
                 fontSize: 15,
                 fontWeight: FontWeight.w600,
                 context: context,
                 fontFamily: 'poppins',
               ),
            ),
          )
        ),
        Positioned(
          top: 40,
          left: 20,
          child: IconButton(
           icon: Image.asset(
             'assets/icons/ic_left.png',
             width: 10,
             height: 20,
           ),
           onPressed: () {
             Navigator.pop(context);
           },
         ),
        ),
      ],
    ),
  );
}

}
