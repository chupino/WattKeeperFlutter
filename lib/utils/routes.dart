import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wattkeeper/components/navBar/navBar.dart';
import 'package:wattkeeper/pages/account.dart';
import 'package:wattkeeper/pages/createGroup.dart';
import 'package:wattkeeper/pages/inbox.dart';
import 'package:wattkeeper/pages/joinGroup.dart';
import 'package:wattkeeper/pages/login.dart';
import 'package:wattkeeper/pages/notifications.dart';
import 'package:wattkeeper/pages/register.dart';

class Routes {
  Future<String> getInitialRoute() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLogged') == true) {
      return '/navBarHome';
    } else {
      return '/login';
    }
  }

  static final List<GetPage<dynamic>> pagesRoutes = [
    GetPage(name: '/navBarHome', page: () => const NavBarWattKeeper()),
    GetPage(name: '/inbox', page: () => const InboxPage()),
    GetPage(name: '/createGroup', page: () => const CreateGroupPage()),
    GetPage(name: '/joinGroup', page: () => const JoinGroupPage()),
    GetPage(name: '/account', page: () => const AccountPage()),
    GetPage(name: '/notifications', page: () => const NotificationsPage()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/register', page: () => const RegisterPage()),
  ];
}
