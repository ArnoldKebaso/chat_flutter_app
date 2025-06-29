// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../screens/splash_screen.dart';
// import '../screens/auth/login_screen.dart';
// import '../screens/auth/signup_screen.dart';
// import '../screens/chat/chat_list_screen.dart';
// import '../screens/chat/chat_room_screen.dart';
//
// class AppRouter {
//   static final _router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (_, __) => const SplashScreen(),
//       ),
//       GoRoute(
//         path: '/login',
//         builder: (_, __) => const LoginScreen(),
//       ),
//       GoRoute(
//         path: '/signup',
//         builder: (_, __) => const SignUpScreen(),
//       ),
//       GoRoute(
//         path: '/chats',
//         builder: (_, __) => const ChatListScreen(),
//       ),
//       GoRoute(
//         path: '/room/:id',
//         builder: (_, state) => ChatRoomScreen(
//           roomId: state.pathParameters['id']!,
//         ),
//       ),
//     ],
//   );
//
//   static GoRouter get router => _router;
// }
