part of product_detail_view;

class SizeComponent extends StatefulWidget {
  const SizeComponent({Key? key, required this.onSizeSelected}) : super(key: key);
  final Function(String) onSizeSelected;

  @override
  State<SizeComponent> createState() => _SizeComponentState();
}

class _SizeComponentState extends State<SizeComponent> {

  List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: sizes
          .map((size) => GestureDetector(
        onTap: () {
          setState(() {
            _selectedSize = size;
          });
          widget.onSizeSelected(size);
        },
        child: Container(
          margin: EdgeInsets.only(left: 16.r,top: 5.h),
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: size == _selectedSize ? ColorResource.primary : ColorResource.white,
            border: Border.all(
              color: ColorResource.black,
              width: 2,
            ),
          ),
          child: Text(
            size,
            style: TextStyle(
              color: size == _selectedSize
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ))
          .toList(),
    );
  }
}
