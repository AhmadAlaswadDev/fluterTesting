part of product_detail_view;

class SwiperComponent extends StatefulWidget {
  SwiperComponent({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<SwiperComponent> createState() => _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent> {

  late Future<List<ProductDetailModel?>> _future;

  Future<void> getProductDetail() async {
    _future = ProductDetailApiController().showProductDetail(widget.id);
    debugPrint('mmm screen=> ${widget.id}');
  }

  @override
  void initState() {
    getProductDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return snapshot.data!.isNotEmpty
                  ? Swiper(
                      duration: 500,
                      autoplay: true,
                      itemCount: snapshot.data!.first!.photos!.length,
                      // itemCount: 3,
                      viewportFraction: 1,
                      scale: 0.8,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200.h,
                              width: double.infinity,
                              child: Image.network(
                                  snapshot.data!.first!.photos![index].path.toString(),
                                  // ImagesApp.tShirt,
                                  fit: BoxFit.fitWidth),
                            ),
                          ],
                        );
                      },
                    )
                  : const Center(child: Text('No Photos'));
            } else {
              return const Center(child: Text('No Data'));
            }
          }),
    );
  }
}
