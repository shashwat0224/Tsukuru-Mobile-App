// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tsukuru/core/providers/internetstatus_provider.dart';
// import 'package:tsukuru/widgets/uihelper.dart';

// class ConnectionOverlay extends StatelessWidget {
//   const ConnectionOverlay({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, Provider, child))
//     (context.read<InternetStatusProvider>().isConnected)
//         ? Stack(
//             children: [
//               ModalBarrier(
//                 dismissible: false,
//                 color: Colors.transparent,
//               ),
//               Center(
//                 child: Card(
//                   color: Colors.transparent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Column(mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       UiHelper.customText(
//                         title: 'No Internet Connection',
//                         size: 28,
//                         color: Colors.black,
//                       ),
//                       UiHelper.customText(
//                         title: 'Please check your connection and try again',
//                         size: 18,
//                         color: Colors.black,
//                       ),
//                       ElevatedButton(
//                         onPressed: () => context.watch<InternetStatusProvider>().startListening(),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                         ),
//                         child: UiHelper.customText(
//                           title: 'Retry',
//                           size: 10,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           )
//         : SizedBox.shrink();
//   }
// }
