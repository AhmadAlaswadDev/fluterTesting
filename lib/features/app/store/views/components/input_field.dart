part of store_view;


class InputField extends StatefulWidget {
  const InputField({Key? key, required this.shopName}) : super(key: key);

  final String shopName;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomTextFieldIcon(
            inputType: TextInputType.visiblePassword,
            obscureText: false,
            icon: IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.clear,color: ColorResource.lightGray,),
            ),
            inputAction: TextInputAction.go,
            hint: context.localizations.search,
            contoller: _searchController,
            onChange: (value) {
              // Implement search logic here
            },
          ),
        ),
        SizedBox(width: 25.w),
        InkWell(
            onTap: () {
              Get.to(() => MapScreen(shopName: widget.shopName));
            },
            child: SVGPicture(assetName: IconsApp.location, height: 19.h, width: 16.w, color: ColorResource.primary),),
        SizedBox(width: 17.w),
        InkWell(
            onTap: () {
              Get.bottomSheet(
                  const FilterBottomSheet(),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
            child: SVGPicture(assetName: IconsApp.filter, height: 22.h, width: 22.w, color: ColorResource.secondary),),
      ],
    );
  }
}



