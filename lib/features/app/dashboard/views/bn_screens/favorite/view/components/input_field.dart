part of favorite_view;

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // _isPasswordShow = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
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
                icon: const Icon(
                  Icons.clear,
                  color: ColorResource.lightGray,
                ),
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
            onTap: () {},
            child: SVGPicture(
                assetName: IconsApp.filter,
                height: 22.h,
                width: 22.w,
                color: ColorResource.secondary),
          ),
        ],
      ),
    );
  }
}
