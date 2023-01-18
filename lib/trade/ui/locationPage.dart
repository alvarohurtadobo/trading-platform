import 'package:flutter/material.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:project_trading/common/components/toast.dart';
import 'package:project_trading/common/components/gpsAppBar.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';

bool initial = true;



class LocationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  int _selectedIndex = 0;
  int? selectedDay;
  int? selectedMonth;
  bool loadingSelection = false;

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
      appBar: gpsAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        width: Sizes.width,
        height: Sizes.height,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: Sizes.width,
                  height: Sizes.width,
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
                      showDefaultInfoWindow: true,
                      staticPoints: [
                        StaticPositionGeoPoint(
                            "0",
                            const MarkerIcon(
                              icon: Icon(
                                Icons.location_on,
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
                      onGeoPointClicked: (geoPoint) async {
                        print("Clicked on $geoPoint");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              geoPoint.toMap().toString(),
                            ),
                            action: SnackBarAction(
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar(),
                              label: "hide",
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  width: Sizes.width,
                  height: Sizes.width,
                  child: const Center(
                    child: Icon(
                      Icons.gps_not_fixed_outlined,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () async {
                if (loadingSelection) {
                  return;
                }
                setState(() {
                  loadingSelection = true;
                });
                GeoPoint p = await controller.centerMap;
                print("Position $p");
                controller.setStaticPosition([p], initial ? "0" : "1");
                if (initial) {
                  origin = p;
                  showToast(
                      "Origen seleccionado es ${p.latitude}, ${p.longitude}");
                } else {
                  destiny = p;
                  showToast(
                      "Destino seleccionado es ${p.latitude}, ${p.longitude}");
                }
                initial = !initial;

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.goToLocation(origin);
                      controller.setZoom(zoomLevel: 12);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: Sizes.tileMini,
                          height: Sizes.tileMini,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xffB1D4F2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Sizes.bullet))),
                        ),
                        horizontalSpace(),
                        const Text(
                          "Origen",
                          style: TextStyle(color: Color(0xff575454)),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(),
                  GestureDetector(
                    onTap: () {
                      controller.goToLocation(destiny);
                      controller.setZoom(zoomLevel: 12);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: Sizes.tileMini,
                          height: Sizes.tileMini,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xff74CF6F),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Sizes.bullet))),
                        ),
                        horizontalSpace(),
                        const Text(
                          "Destino",
                          style: TextStyle(color: Color(0xff575454)),
                        ),
                      ],
                    ),
                  )
                ],
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
        controller.goToLocation(destiny);
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
