part of track_myorder_view;

class MapViewButton extends StatefulWidget {
  const MapViewButton({Key? key}) : super(key: key);

  @override
  State<MapViewButton> createState() => _MapViewButtonState();
}

class _MapViewButtonState extends State<MapViewButton> {
  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>
        //     const MapScreen(),
        //   ),
        // );
      },
      title: 'Map View',
      assetName: '',
      titleColor: ColorResource.white,
      fontSize: 18.sp,
      widthButton: 156.w,
      heightButton: 50.h,
      radius: 5.r,
      backgroundColor: ColorResource.secondary,
    );
  }
}
