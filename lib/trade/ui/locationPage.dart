import 'package:flutter/material.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/toast.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:project_trading/common/components/gpsAppBar.dart';
import 'package:project_trading/common/components/verticalSpac.dart';

class LocationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  int _selectedIndex = 0;
  int? selectedDay;
  int? selectedMonth;
  bool loadingSelection = true;

  MapController controller = MapController(
    initMapWithUserPosition: true,
    // initPosition: GeoPoint(latitude: 39.465038, longitude: -0.384516),
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
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      controller.advancedPositionPicker();
      setState(() {
        loadingSelection = false;
      });
    });
    super.initState();
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
                showZoomController: true,
                trackMyPosition: true,
                initZoom: 12,
                minZoomLevel: 8,
                maxZoomLevel: 14,
                stepZoom: 1.0,
                mapIsLoading: Center(
                    child: SizedBox(
                        width: Sizes.padding/2,
                        height: Sizes.padding/2,
                        child: const CircularProgressIndicator())),
                onLocationChanged: (myLocation) {
                  print("My location is $myLocation");
                },
                onGeoPointClicked: (geoPoint) async {
                  print("Clicked on $geoPoint");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        geoPoint.toMap().toString(),
                      ),
                      action: SnackBarAction(
                        onPressed: () =>
                            ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                        label: "hide",
                      ),
                    ),
                  );
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
            GestureDetector(
              onTap: () async {
                if (loadingSelection) {
                  return;
                }
                setState(() {
                  loadingSelection = true;
                });
                await Future.delayed(Duration(seconds: 4));
                GeoPoint p =
                    await controller.getCurrentPositionAdvancedPositionPicker();
                controller.advancedPositionPicker();
                print("Position $p");
                showToast(
                    "Ubicación seleccionada es ${p.latitude}, ${p.longitude}");
                setState(() {
                  loadingSelection = false;
                });
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: Sizes.padding, vertical: Sizes.padding / 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "big sunova, Valencia",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Tap to select this location",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black38))
                      ],
                    ),
                    loadingSelection
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ),
            verticalSpace(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
                      child: const Text("Nerby Places"),
                    ),
                    verticalSpace(),
                    positionTile(
                        Icons.location_on_rounded, Colors.red, "Valencia"),
                    verticalSpace(),
                    positionTile(
                        Icons.indeterminate_check_box_outlined,
                        const Color.fromARGB(255, 19, 53, 82),
                        "Corporación Inlaca, C.A."),
                    verticalSpace(),
                    positionTile(Icons.indeterminate_check_box_outlined,
                        const Color.fromARGB(255, 19, 53, 82), "ximko.com"),
                    verticalSpace(),
                    positionTile(
                        Icons.indeterminate_check_box_outlined,
                        const Color.fromARGB(255, 19, 53, 82),
                        "seguros caroni"),
                    verticalSpace(),
                    positionTile(
                        Icons.indeterminate_check_box_outlined,
                        const Color.fromARGB(255, 19, 53, 82),
                        "Casa David Hogar"),
                    verticalSpace(),
                    positionTile(
                        Icons.indeterminate_check_box_outlined,
                        const Color.fromARGB(255, 19, 53, 82),
                        "Corporación Inlaca, C.A."),
                    verticalSpace(),
                  ],
                ),
              ),
            ),
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
