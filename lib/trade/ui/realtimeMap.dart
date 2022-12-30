import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/realtimeAppbar.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';

class RealtimeMapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RealtimeMapPageState();
}

class _RealtimeMapPageState extends State<RealtimeMapPage> {
  int _selectedIndex = 0;
  int? selectedDay;
  int? selectedMonth;
  bool loadingSelection = true;

  MapController controller = MapController(
    initMapWithUserPosition: false,
    initPosition: origin,
    // areaLimit: BoundingBox(
    //   east: 3.384516,
    //   north: 42.465038,
    //   south: 36.465038,
    //   west: -3.384516,
    // ),
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
      appBar: realtimeAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        width: Sizes.width,
        height: Sizes.height,
        child: Column(
          children: [
            Expanded(
              child: OSMFlutter(
                controller: controller,
                showZoomController: true,
                trackMyPosition: false,
                initZoom: 12,
                minZoomLevel: 8,
                maxZoomLevel: 14,
                stepZoom: 1.0,
                mapIsLoading: Center(
                    child: SizedBox(
                        width: Sizes.padding / 2,
                        height: Sizes.padding / 2,
                        child: const CircularProgressIndicator())),
                onLocationChanged: (myLocation) {
                  print("My location is $myLocation");
                },
                staticPoints: [
                  StaticPositionGeoPoint(
                      "0",
                      const MarkerIcon(
                        icon: Icon(
                          Icons.add_location_alt_sharp,
                          color: Color(0xffB1D4F2),
                          size: 60,
                        ),
                      ),
                      [origin]),
                  StaticPositionGeoPoint(
                      "1",
                      const MarkerIcon(
                        icon: Icon(
                          Icons.location_on,
                          color: Color(0xff74CF6F),
                          size: 60,
                        ),
                      ),
                      [destiny]),
                ],
                userLocationMarker: UserLocationMaker(
                    personMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.person,
                        size: 1,
                      ),
                    ),
                    directionArrowMarker: const MarkerIcon(
                      icon: Icon(Icons.person, size: 1),
                    )),
              ),
            ),
            verticalSpace(),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: Text(
                "Tiempo en transcurso:",
                style: TextStyle(
                    fontSize: Sizes.font08,
                    color: const Color(0xff175799),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: Text(
                "3 días",
                style: TextStyle(
                    fontSize: Sizes.font10, color: const Color(0xff175799)),
              ),
            ),
            verticalSpace(),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: Text(
                "Pre-carriage:",
                style: TextStyle(
                    fontSize: Sizes.font08,
                    color: const Color(0xff175799),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: Text(
                "recibirá una alerta en el momento",
                style: TextStyle(
                    fontSize: Sizes.font10, color: const Color(0xff175799)),
              ),
            ),
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
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed("/home");
        break;
      case 1:
        Navigator.of(context).pushNamed("/notifications");
        break;
      case 2:
        Navigator.of(context).pushNamed("/orders");
        break;
      case 3:
        Navigator.of(context).pushNamed("/profile");
        break;
      default:
        Navigator.of(context).pushNamed("/home");
    }
  }

  Widget positionTile(IconData icon, Color color, String message) {
    return GestureDetector(
      onTap: () {
        GeoPoint p = GeoPoint(latitude: 39.457087, longitude: -0.388293);
        controller.goToLocation(p);
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            horizontalSpace(),
            Text(message),
          ],
        ),
      ),
    );
  }
}
