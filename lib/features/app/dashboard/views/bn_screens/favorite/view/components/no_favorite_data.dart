part of favorite_view;


class NoFavoriteData extends StatelessWidget {
  const NoFavoriteData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SVGPicture(assetName: IconsApp.noFavorite),
            SizedBox(height: 27.h,),
            TextApp(
              text: context.localizations.noFavoritesYet,
              // text: 'No favorites yet',
              textAlign: TextAlign.center,
              fontSize: 14.sp,
              color: ColorResource.black,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 11.h,),
            TextApp(
              text: context.localizations.tapOnHeart,
              // text: 'Tap on the heart to add to your favorites!',
              textAlign: TextAlign.center,
              fontSize: 14.sp,
              color: ColorResource.black,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 11.h,),
            TextApp(
              text: context.localizations.addActivities,
              // text: 'Add activities to your favorites, them here at a glance.',
              textAlign: TextAlign.center,
              fontSize: 14.sp,
              color: ColorResource.black,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}