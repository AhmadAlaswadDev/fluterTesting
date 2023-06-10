part of home_view;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(top: 37.h, bottom: 10.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchInputField(),
                SizedBox(height: 15.h),
                TabBar(
                  padding: EdgeInsets.only(bottom: 10.h),
                  controller: _tabController,
                  onTap: (value) {
                    // _tabController = value as TabController;
                  },
                  indicatorColor: ColorResource.secondary,
                  indicatorWeight: 5.w,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: const ShapeDecoration(
                    shape: UnderlineInputBorder(),

                  ),
                  labelColor: ColorResource.secondary,
                  unselectedLabelColor: ColorResource.gray,
                  labelStyle:
                  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  unselectedLabelStyle:
                  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),

                  tabs: [
                    Tab(
                      text: context.localizations.products,
                    ),
                    Tab(
                      text: context.localizations.stores,
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                      controller: _tabController,
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        ProductsComponent(),
                        StoresComponent(),
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
