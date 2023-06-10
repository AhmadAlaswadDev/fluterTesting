//
// class UpdateUserController extends GetxController {
//   UserProvider userProvider = UserProvider();
//   var userId = FirebaseAuth.instance.currentUser!.uid;
//   var emailId = FirebaseAuth.instance.currentUser!.email;
//   var loading = false.obs;
//   GenderSelectionController genderSelectionController = Get.find();
//   CitySelectionController citySelectionController = Get.find();
//
//   late TextEditingController nameController;
//   late TextEditingController passwordController;
//
//   late TextEditingController mobileController;
//
//   late TextEditingController ageController;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getUserData();
//     nameController = TextEditingController();
//     passwordController = TextEditingController();
//     mobileController = TextEditingController();
//     ageController = TextEditingController();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//     nameController.dispose();
//     passwordController.dispose();
//     mobileController.dispose();
//     ageController.dispose();
//   }
//
//   Future<void> createUser() async {
//     if (passwordController.text.isNotEmpty) {
//       FirebaseAuth.instance.currentUser!
//           .updatePassword(passwordController.text);
//     }
//
//     if (nameController.text.isNotEmpty &&
//         ageController.text.isNotEmpty &&
//         mobileController.text.isNotEmpty &&
//         citySelectionController.selectedCity.value != "" &&
//         genderSelectionController.selectedGender.value != "") {
//       UserProvider.createUser({
//         "firebaseId": userId,
//         "username": nameController.text,
//         "password": passwordController.text,
//         "email": "$emailId",
//         "phoneNumber": mobileController.text,
//         "gender": genderSelectionController.selectedGender.value,
//         "age": ageController.text,
//         "city": citySelectionController.selectedCity.value,
//         "userType": "Regular"
//       }).then((value) {
//         print("😩");
//         print(value);
//         Get.offNamed(Routes.dashboard);
//       });
//     }
//     //
//   }
//
//   Future<void> getUserData() async {
//     loading.value = true;
//
//    UserProvider.getUserCheck(userId).then((value) {
//       if (value == false) {
//         loading.value = false;
//         // Get.snackbar("no data", "complte your data ",
//         //     backgroundColor: Colors.red.shade300);
//         return;
//       }
//       if (value == true) {
//         loading.value = false;
//         Get.offNamed(Routes.dashboard);
//         // Get.snackbar("thank you", "مع السلامة ",
//         //     backgroundColor: Colors.green.shade300);
//       }
//     });
//     // print(getData);
//
//
//   }
// }
