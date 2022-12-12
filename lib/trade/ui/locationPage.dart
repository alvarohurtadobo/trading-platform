import 'package:flutter/material.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:project_trading/common/components/gpsAppBar.dart';

class LocationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  int _selectedIndex = 0;
  int? selectedDay;
  int? selectedMonth;

  MapController controller = MapController(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);

    return Scaffold(
      appBar: gpsAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        width: Sizes.width,
        height: Sizes.height,
        child: Column(
          children: [
            SizedBox(
              width: Sizes.width,
              height: Sizes.width,
              child: OSMFlutter(
                controller: controller,
                trackMyPosition: false,
                initZoom: 12,
                minZoomLevel: 8,
                maxZoomLevel: 14,
                stepZoom: 1.0,
                mapIsLoading: const Center(child: CircularProgressIndicator()),
                onGeoPointClicked: (GeoPoint geo) {
                  print("Click (${geo.latitude}, ${geo.longitude})");
                },
                onLocationChanged: (GeoPoint geo) {
                  print("Change (${geo.latitude}, ${geo.longitude})");
                },
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_history_rounded,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.double_arrow,
                      size: 48,
                    ),
                  ),
                ),
                roadConfiguration: RoadConfiguration(
                  startIcon: const MarkerIcon(
                    icon: Icon(
                      Icons.person,
                      size: 64,
                      color: Colors.brown,
                    ),
                  ),
                  roadColor: Colors.yellowAccent,
                ),
                markerOption: MarkerOption(
                    defaultMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.person_pin_circle,
                    color: Colors.blue,
                    size: 56,
                  ),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:Sizes.padding, vertical: Sizes.padding/4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "big sunova, Valencia",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Tap to select this location",
                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black38))
                    ],
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
            verticalSpace(),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),child: Text("Nerby Places"),),
            verticalSpace(),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),child: Row(
                children: [
                  Icon(Icons.location_on_rounded, color: Colors.red,),
                  Text("Valencia"),
                ],
              ),),
            verticalSpace(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xff3075B6),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0xff3075B6),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff3075B6),
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff3075B6),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff3075B6),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff3075B6),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
