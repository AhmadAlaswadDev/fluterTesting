part of home_view;


class MapScreen extends StatefulWidget {

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final HomeController homeController = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: TextApp(text: 'Location Map',color: ColorResource.black),
      ),
      body: Center(
        child: GoogleMap(
          mapType: MapType.normal,
          padding: EdgeInsets.all(1.w),
          initialCameraPosition: homeController.initialCameraPosition(),
          onMapCreated: onMapCreated,
          markers: homeController.markers,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          // onTap: onTapMap,
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      homeController.mapController = controller;
    });
  }

}
