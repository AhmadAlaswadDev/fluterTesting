part of profile_view;

class ProgressComponent extends StatefulWidget {
  const ProgressComponent({Key? key}) : super(key: key);

  @override
  State<ProgressComponent> createState() => _ProgressComponentState();
}

class _ProgressComponentState extends State<ProgressComponent> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _updateProgressValue();
  }

  Future<void> _updateProgressValue() async {
    String savedValue = await SharedPrefController().saved;
    double parsedValue = double.tryParse(savedValue.replaceAll("ر.س", "")) ?? 0.0;
    setState(() {
      _progressValue = parsedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: const [
            ColorResource.primary,
            ColorResource.white,
            ColorResource.lightGray,
          ],
          stops: [
            _progressValue / 100,
            _progressValue / 100,
            _progressValue / 100,
          ],
        ),
      ),
      child: TextApp(
        text: '${_progressValue.toStringAsFixed(0)}%',
        fontSize: 9.sp,
        fontWeight: FontWeight.w700,
        color: ColorResource.black,
      ),
    );
  }
}
