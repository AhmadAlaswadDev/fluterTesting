part of product_detail_view;


class ColorComponent extends StatefulWidget {
  const ColorComponent({Key? key, required this.colors, required this.onColorSelected}) : super(key: key);

  final List<Color> colors;
  final Function(Color)? onColorSelected;


  @override
  State<ColorComponent> createState() => _ColorComponentState();
}

class _ColorComponentState extends State<ColorComponent> {

  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors
          .map((color) => GestureDetector(
        onTap: () {
          setState(() {
            _selectedColor = color;
          });
          widget.onColorSelected!(color);
        },
        child: Container(
          margin: EdgeInsets.only(left: 16.r,top: 5.h),
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
              color: color == _selectedColor
                  ? ColorResource.black
                  : ColorResource.transparent,
              width: 2,
            ),
          ),
        ),
      ))
          .toList(),
    );
  }
}
