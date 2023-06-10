part of home_view;


class SearchInputField extends StatefulWidget {
  const SearchInputField({Key? key}) : super(key: key);

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {

  final HomeController homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: CustomTextFieldIcon(
        inputType: TextInputType.text,
        obscureText: false,
        icon: IconButton(
          onPressed: () {
            setState(() {
              homeController.searchController.clear();
            });
          },
          icon: const Icon(Icons.clear,color: ColorResource.lightGray,),
        ),
        inputAction: TextInputAction.done,
        hint: context.localizations.search,
        contoller: homeController.searchController,
        onChange: (searchText) {
          debugPrint('mmm S1=>${searchText}');
          debugPrint('mmm S2=>${searchText}');
          setState(() {
           homeController.searchResults = homeController.searchProduct
                .where((product) =>
                product.name!
                    .toLowerCase()
                    .contains(searchText.toLowerCase()))
                .toList();
            debugPrint('mmm S3=>${homeController.searchResults}');
            debugPrint('mmm S3=>${homeController.searchResults.length}');
          });
        },
      ),
    );
  }

}



