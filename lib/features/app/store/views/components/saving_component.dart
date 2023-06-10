part of store_view;

class SavingComponent extends StatefulWidget {
  const SavingComponent({Key? key, required this.save}) : super(key: key);

  final String save;

  @override
  State<SavingComponent> createState() => _SavingComponentState();
}

class _SavingComponentState extends State<SavingComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 98.w,
          height: 24.h,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            color: ColorResource.green.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: TextApp(
            text: context.localizations.youSaved,
            color: ColorResource.green,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            fontSize: 8.sp,
            maxLine: 1,
          ),
        ),
        Container(
          width: 56.w,
          height: 24.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorResource.green,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: TextApp(
            text: widget.save,
            color: ColorResource.white,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
            fontSize: 11.sp,
            maxLine: 1,
          ),
        ),
      ],
    );
  }
}

