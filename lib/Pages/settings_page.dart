import 'package:biocoder/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import '../Widgets/my_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

void changeLanguage(){
  Get.updateLocale(
      Get.locale == const Locale("tr","TR") ?  const Locale("en","EN")  :  const Locale("tr","TR")
  );
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("home_ayarlar".tr),
        backgroundColor: bioBlue,
      ),
      body: Center(
        child: SettingsList(
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: Text('dil'.tr),
                  trailing: MyButton(color: bioBlue, text: 'button_lang'.tr, width: 50, height: 30,
                      onTap: changeLanguage

                  ),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: true,
                  leading: const Icon(Icons.sms),
                  title: const Text('SMS'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: true,
                  leading: const Icon(Icons.notifications),
                  title: Text('bildirim'.tr),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.notification_important_outlined),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('bildirimaralığı'.tr),
                      DropdownButton(

                          value: 0,
                          items:  [
                            DropdownMenuItem(
                              value: 0,
                              child: Text("5dk".tr),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text("10dk".tr),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text("15dk".tr),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text("20dk".tr),
                            ),
                          ],
                          onChanged: (value) {}),
                    ],
                  ),

                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.circle_notifications),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('bildirimşekli'.tr),
                      DropdownButton(
                          value: 0,
                          items:  [
                            DropdownMenuItem(child: Text("SMS"),value: 0,),
                            DropdownMenuItem(child: Text("Email"),value: 1,),
                            DropdownMenuItem(child: Text("smsemail".tr),value: 2,),
                          ], onChanged: (value){

                      }),
                    ],
                  ),

                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: true,
                  leading: const Icon(Icons.mail),
                  title: const Text('Mail'),
                ),
                SettingsTile.navigation(
                  leading: const Text("30C°",style: TextStyle(fontWeight: FontWeight.w500),),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('home_sıcaklıkvenem'.tr),
                      DropdownButton(
                          value: 0,
                          items:  [
                            DropdownMenuItem(
                              value: 0,
                              child: Text("15dk".tr),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text("30dk".tr),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text("60dk".tr),
                            ),

                          ],
                          onChanged: (value) {}),
                    ],
                  ),

                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.filter_drama_outlined),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('hava'.tr),
                      DropdownButton(
                          value: 0,
                          items:  [
                            DropdownMenuItem(
                              value: 0,
                              child: Text("15dk".tr),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text("30dk".tr),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text("60dk".tr),
                            ),

                          ],
                          onChanged: (value) {}),
                    ],
                  ),

                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.surround_sound),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('home_ses'.tr),
                      DropdownButton(
                          value: 1,
                          items:  [
                            DropdownMenuItem(
                              value: 0,
                              child: Text("30dk".tr),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text("60dk".tr),
                            ),

                          ],
                          onChanged: (value) {}),
                    ],
                  ),

                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.line_weight),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('home_ağırlık'.tr),
                      DropdownButton(
                          value: 1,
                          items:  [
                            DropdownMenuItem(
                              value: 0,
                              child: Text("12saat".tr),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text("24saat".tr),
                            )
                          ],
                          onChanged: (value) {}),
                    ],
                  ),

                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.place_outlined),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('home_konum'.tr),
                      DropdownButton(
                          value: 1,
                          items:  [

                            DropdownMenuItem(
                              value: 1,
                              child: Text("24saat".tr),
                            )
                          ],
                          onChanged: (value) {}),
                    ],
                  ),


                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
