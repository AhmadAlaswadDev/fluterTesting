part of product_detail_view;

class QuantityComponent extends StatefulWidget {
  const QuantityComponent({Key? key, required this.onQuantitySelected}) : super(key: key);
  final Function(int) onQuantitySelected;


  @override
  State<QuantityComponent> createState() => _QuantityComponentState();
}

class _QuantityComponentState extends State<QuantityComponent> {

  final int minQuantity = 1;
  final int maxQuantity = 10;
  int _selectedQuantity = 1;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if(_selectedQuantity != 1 && minQuantity != 0 ){
                _selectedQuantity--;
              }else{}
            });
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            margin: EdgeInsets.only(left: 16.r,top: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: ColorResource.white,
              border: Border.all(
                color: ColorResource.black,
                width: 2,
              ),
            ),
            child: const Icon(Icons.remove_rounded),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextApp(
              text: '$_selectedQuantity',
            color: ColorResource.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if(_selectedQuantity == maxQuantity){
              }else{
                _selectedQuantity++;
              }
            });
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            margin: EdgeInsets.only(right: 16.r,top: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: ColorResource.white,
              border: Border.all(
                color: ColorResource.black,
                width: 2,
              ),
            ),
            child: Icon(Icons.add_rounded),
          ),
        ),
      ],
    );
  }
}
