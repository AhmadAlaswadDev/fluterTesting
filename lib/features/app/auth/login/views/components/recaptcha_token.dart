part of login_view;


class ReCAPTCHAToken extends StatefulWidget {
  const ReCAPTCHAToken({Key? key}) : super(key: key);

  @override
  State<ReCAPTCHAToken> createState() => _ReCAPTCHATokenState();
}

class _ReCAPTCHATokenState extends State<ReCAPTCHAToken> {

  LoginController controller = Get.put(LoginController());

  final FirebaseRecaptcha _firebaseRecaptcha = FirebaseRecaptcha(
    firebaseConfig: const {
      'apiKey': "AIzaSyAcV7o7oclWMNL4wHtT3cmbSxRZ6olNcVU",
      'authDomain': "zaheed-d96af.firebaseapp.com",
      'databaseURL': "https://zaheed-d96af-default-rtdb.firebaseio.com",
      'projectId': "zaheed-d96af",
      'storageBucket': "zaheed-d96af.appspot.com",
      'messagingSenderId': "1006364124183",
      'appId': "1:1006364124183:web:373ac912caaacaa68d6852",
      'measurementId': "G-H69MF3K0J1"
      // Add any additional configuration parameters here
    },
    onVerify: (token) {
      print('Recaptcha token: $token');
      if (token != null) {
        // Recaptcha verification succeeded.
        // Perform your desired actions here.
        print('Recaptcha token: $token');
      } else {
        // Recaptcha verification failed.
        print('Recaptcha verification failed. Please try again.');
      }
    },
    onError: (error) {
      print('Recaptcha Error: $error');
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FirebaseRecaptchaVerifierModal(
          firebaseConfig: _firebaseRecaptcha.firebaseConfig,
          onVerify: (token) async {
            setState(() {
              controller.reCAPTCHAToken.value = token;
              debugPrint('mmm reCAPTCHAToken=> ${controller.reCAPTCHAToken.value}');
            });
          },
          onLoad: () => debugPrint('onLoad'),
          onError: () => debugPrint('onError'),
          onFullChallenge: () => debugPrint('onFullChallenge'),
          attemptInvisibleVerification: true,
        ),
      ),
    );
  }
}
