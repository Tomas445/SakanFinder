import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mano/feature/gui/screens/cubits/home_cubit/home_cubit.dart';
import 'package:mano/main.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
        final cubit = BlocProvider.of<HomeCubit>(context);

    bool dark = false ;
    return  BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is MoodState){
          dark = !dark;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(.94),
          appBar: AppBar(
            title: const Text(
              "الاعدادات",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                // user card
    
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.profile_circled,
                      iconStyle: IconStyle(),
                      title: 'الملف الشخصي',
                      titleStyle: const TextStyle(),
                      subtitle: "يمكنك اضافة او تعديل بيانك الشخصية ",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.lock_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.red,
                      ),
                      title: 'اعدادات الخصوصية',
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.dark_mode_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      title: 'الوضع الليلي',
                      subtitle: "تقائي",
                      trailing: Switch.adaptive(
                        value: dark,
                        onChanged: (value) {
                         cubit.getMoods();
                          print(dark);
                        },
                      ),
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.home_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: const Color(0xffFF9800),
                      ),
                      title: 'حجوزاتي',
                      subtitle: 'تابع حجوزاتك',
                    ),
                  ],
                ),
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.info_rounded,
                      iconStyle: IconStyle(
                        backgroundColor: Colors.purple,
                      ),
                      title: 'حول التطبيق',
                      subtitle: "اعرف المزيد عن التطبيق",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.privacy_tip_rounded,
                      iconStyle: IconStyle(
                        backgroundColor: const Color.fromARGB(255, 47, 195, 130),
                      ),
                      title: 'الشروط وسياسة الخصوصية',
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.code,
                      iconStyle: IconStyle(
                        backgroundColor: const Color.fromARGB(255, 42, 111, 213),
                      ),
                      title: 'المطورين',
                    ),
                  ],
                ),
    
                // You can add a settings title
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {
                        sharedPref.clear();
                        Navigator.of(context).pushReplacementNamed("Login");
                        cubit.bottomNavIndex =2;
                      },
                      icons: Icons.exit_to_app_rounded,
                      title: "تسجيل خروج",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.repeat,
                      title: "تغيير حسابي",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.delete_solid,
                      title: "حذف حسابي",
                      titleStyle: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      );
      },
    
    );}}