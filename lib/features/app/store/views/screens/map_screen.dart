part of store_view;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.shopName});

  final String shopName;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final ShopDetailController shopDetailController =
      Get.put(ShopDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: TextApp(text: widget.shopName, color: ColorResource.black),
      ),
      body: Center(
        child: GoogleMap(
          mapType: MapType.normal,
          padding: EdgeInsets.all(1.w),
          initialCameraPosition: shopDetailController.initialCameraPosition(
              double.parse(shopDetailController.shopDetailModel.latitude!),
              double.parse(shopDetailController.shopDetailModel.longitude!)),
          onMapCreated: onMapCreated,
          markers: shopDetailController.markers,
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
      shopDetailController.mapController = controller;
    });
  }
}
