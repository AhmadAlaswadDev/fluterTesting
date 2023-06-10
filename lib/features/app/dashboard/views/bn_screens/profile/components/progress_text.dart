part of profile_view;

class ProgressText extends StatefulWidget {
  const ProgressText({Key? key}) : super(key: key);

  @override
  State<ProgressText> createState() => _ProgressTextState();
}

class _ProgressTextState extends State<ProgressText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextApp(
            text: '${context.localizations.youSaved} : ${SharedPrefController().saved}',
            fontSize: 15.sp,
            color: ColorResource.green,
          ),
          // TextApp(
          //   text: '${context.localizations.theGoal} :1000 SR',
          //   fontSize: 15.sp,
          //   color: ColorResource.green,
          // ),
        ],
      ),
    );
  }
}
