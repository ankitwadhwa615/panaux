// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/material.dart';
//
// class VideocallScreen extends StatefulWidget {
//   @override
//   State<VideocallScreen> createState() => _VideocallScreenState();
// }
//
//
//
// class _VideocallScreenState extends State<VideocallScreen> {
//
// 	final AgoraClient client = AgoraClient(
// 		agoraConnectionData: AgoraConnectionData(
// 			appId: "36e2c78fc33940ab84a863c6d7b013a6",
// 			channelName: "panaux1",
// 			tempToken: "00636e2c78fc33940ab84a863c6d7b013a6IABYJ7/ek1dSKPLL6d16h38DZqY+AXM+KnYLqgYFfacDxJ/TNvMAAAAAIgCZbnoCZsChYgQAAQBqcqBiAgBqcqBiAwBqcqBiBABqcqBi",
// 		),
// 		enabledPermission: [
// 			Permission.camera,
// 			Permission.microphone,
// 		],
// 	);
//
//
// 	void initAgora() async {
// 		await client.initialize();
// 	}
//
// 	@override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initAgora();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
// 	    child: Stack(
// 		    children: [
// 			    AgoraVideoViewer(
// 				    client: client,
// 				    layoutType: Layout.floating,
// 				    floatingLayoutContainerHeight: 100,
// 				    floatingLayoutContainerWidth: 100,
// 				    showNumberOfUsers: true,
// 				    showAVState: true,
// 			    ),
// 			    AgoraVideoButtons(
// 				    client: client,
// 			    ),
// 		    ],
// 	    ),
//     );
//   }
// }
