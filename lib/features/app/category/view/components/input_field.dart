part of category_view;


class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

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
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
    );
  }
}



