import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:tsukuru/api/api_func.dart';
import 'package:tsukuru/widgets/countdowntimer.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  bool allow = false;
  Color color = Colors.black;

  final GlobalKey<CountdownTimerState> timerKey = GlobalKey();

  void onEnd() {
    setState(() {
      allow = true;
      color = Colors.blue;
    });
  }


  @override
  void initState() {
    super.initState();
    // On web, disable the browser's context menu since this example uses a custom
    // Flutter-rendered context menu.

    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Verify Email'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontFamily: 'Alata',
        ),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        // You can also checkout the [PinputBuilderExample]
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customText(
                title: 'Verification',
                size: 32,
                color: Colors.black,
                fontFamily: 'Alata',
              ),
              SizedBox(height: 8),
              UiHelper.customText(
                title: 'Enter the verification code\n sent to your mail',
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Merriweather',
              ),
              SizedBox(height: 15),
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  length: 6,
                  enableInteractiveSelection: true,
                  controller: pinController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                    verifyEmail(pin, widget.email);
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              SizedBox(height: 4,),
              UiHelper.customText(title: 'NOTE - Case Sensitive', size: 14, color: Colors.red),
              SizedBox(height: 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UiHelper.customText(
                    title: 'Resend OTP in',
                    size: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CountdownTimer(key: timerKey,time: 60,fontSize: 15,onTimerFinished: onEnd,),
                  ),
                  UiHelper.customText(
                    title: 'seconds',
                    size: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customText(
                    title: 'Didn;t receive a code?',
                    size: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  TextButton(
                    onPressed: () {
                      if (allow) {
                        timerKey.currentState?.startTimer();
                        print('resend');
                        setState(() {
                          allow = false;
                          color = Colors.black;
                        });
                        resendCode(widget.email);
                      }
                    },
                    child: UiHelper.customText(
                      title: 'Resend',
                      size: 15,
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
