// Imports necessary packages and files for the application.
// 'chat_page.dart' contains the UI for the main chat screen.
import 'package:chat_app/chat_page.dart';
// 'login_page.dart' contains the UI for the user login screen.
import 'package:chat_app/login_page.dart';
// 'auth_service.dart' handles user authentication logic.
import 'package:chat_app/services/auth_service.dart';
// 'material.dart' provides Flutter's Material Design widgets.
import 'package:flutter/material.dart';
// 'provider.dart' is used for state management, allowing widgets to access and listen to changes in data.
import 'package:provider/provider.dart';

// The main entry point of the application.
void main() async {
  // Ensures that Flutter's widget binding is initialized. This is necessary
  // if you need to interact with the Flutter engine before runApp() is called,
  // for example, when calling platform-specific code.
  WidgetsFlutterBinding.ensureInitialized();
  // Initializes the AuthService. This might involve setting up connections
  // to a backend or loading user data. The 'await' keyword means this
  // line will complete before the next line is executed.
  await AuthService.init();
  // Runs the application.
  // ChangeNotifierProvider makes an instance of AuthService available to
  // all descendant widgets in the widget tree.
  // This allows other parts of the app to access authentication state and methods.
  runApp(ChangeNotifierProvider(
    // Creates an instance of AuthService.
    create: (BuildContext context) => AuthService(),
    // The root widget of the application.
    child: ChatApp(),
  ));
}

// Defines the root widget of the application.
// It's a StatelessWidget because its own state doesn't change over time.
// Its appearance is determined by the data it receives and the state of other objects (like AuthService).
class ChatApp extends StatelessWidget {
  // The build method describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    // MaterialApp is a convenience widget that wraps a number of widgets
    // that are commonly required for Material Design applications.
    return MaterialApp(
      // The title of the application, which might be used by the OS.
      title: "Chat App",
      // Defines the visual theme of the application.
      theme: ThemeData(
        // Sets the default canvas color to transparent.
          canvasColor: Colors.transparent,
          // Sets the primary color swatch for the app (used for things like AppBar backgrounds by default).
          primarySwatch: Colors.deepPurple,
          // Customizes the appearance of AppBars throughout the application.
          appBarTheme: AppBarTheme(
            // Sets the background color of AppBars.
              backgroundColor: Colors.blue,
              // Sets the foreground color of AppBars (e.g., text and icons).
              foregroundColor: Colors.black)),
      // The widget displayed as the "home" screen of the application.
      // FutureBuilder is used here to conditionally display UI based on the
      // result of an asynchronous operation (checking if the user is logged in).
      home: FutureBuilder<bool>(
        // The asynchronous computation whose result will determine the UI.
        // It calls the isLoggedIn() method from AuthService, which is accessed
        // using context.read<AuthService>(). This method likely returns true if
        // the user is logged in, and false otherwise.
          future: context.read<AuthService>().isLoggedIn(),
          // The builder function is called when the future completes.
          // It receives the build context and an AsyncSnapshot, which contains
          // the state of the future (e.g., whether it's still loading, has data, or has an error).
          builder: (context, AsyncSnapshot<bool> snapshot) {
            // Checks if the future has completed.
            if (snapshot.connectionState == ConnectionState.done) {
              // Checks if the future completed successfully with data and if that data is true.
              if (snapshot.hasData && snapshot.data!) {
                // If the user is logged in (snapshot.data is true), display the ChatPage.
                return ChatPage();
              } else {
                // If the user is not logged in or there was an issue, display the LoginPage.
                return LoginPage();
              }
            }
            // While the future is still loading, display a circular progress indicator.
            return CircularProgressIndicator();
          }),

      // Defines named routes for navigation within the app.
      // This allows you to navigate to specific screens using their names.
      routes: {
        // Defines a route named '/chat' that, when navigated to, will build and display a ChatPage widget.
        '/chat': (context) => ChatPage()
      },
    );
  }
}