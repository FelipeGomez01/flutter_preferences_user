import 'package:flutter/material.dart';
import 'package:flutter_preferences_user/src/pages/settings_page.dart';

import '../pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes()
{
  return <String, WidgetBuilder>
  {
    HomePage.routeName     : ( _ ) => HomePage(),
    SettingsPage.routeName : ( _ ) => SettingsPage()
  };
}