import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/user_image.dart';
import 'package:neighborgood/core/constants/colors.dart';
import 'package:neighborgood/features/addpost/view/addpost_page.dart';
import 'package:neighborgood/features/home/model/get_user_info.dart';
import 'package:neighborgood/features/homepage/view/homepage_page.dart';
import 'package:neighborgood/features/profile/view/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserService userService = UserService();
  getUser() {
    userService.getUserInfo(
        context.read<AuthenticationRepository>().firebaseAuth.currentUser!.uid);
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  int index = 0;
  List pages = [
    const HomepagePage(),
    const SizedBox(),
    const AddpostPage(),
    const SizedBox(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.w),
          child: pages.elementAt(index),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (int value) {
              index = value;
              setState(() {});
            },
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            selectedIconTheme:
                const IconThemeData(color: AppColors.primaryColor),
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Icon(
                      index == 0 ? Icons.home : Icons.home_outlined,
                      size: 26.r,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Icon(
                      Icons.search,
                      size: 26.r,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 26.r,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Image.asset('assets/icon.png'),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: const UserImage(),
                  ),
                  label: '')
            ]),
      ),
    );
  }
}
