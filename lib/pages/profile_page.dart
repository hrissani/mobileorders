import 'package:flutter/material.dart';
import 'package:mobileorders/pages/edit_profile_page.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/buttun.dart';
import 'package:provider/provider.dart';

import '../assets/text_styles.dart';
import '../bi/profile/profile.dart';
import '../bi/user/user_provider.dart';
import '../repository/repository.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarCustom(title: "Профиль"),
            SizedBox(
              height: 25,
            ),
            // /profileimage
            _image(),
            Spacer(),
            Expanded(
              child: Container(
                child: _description(
                    Provider.of<UserProvider>(context, listen: false)),
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                  text: "Редактировать профиль",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditProfileM()));
                  }),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  static const AssetImage imageProf = AssetImage('images/avatar.png');
  Widget _image() {
    // context.read<Profile>().getImageUrl()

    return Container(
      height: 120,
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: const Image(
        image: imageProf,
        // IconsUpDesign.camera,
        // size: 24,
        // color: Colors.grey,
      ),
    );
  }

  Widget _description(UserProvider providerUser) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textDescription("Имя пользователя", "${providerUser.name}"),
        const SizedBox(
          height: 15,
        ),
        _textDescription("Логин пользователя", "${providerUser.email}"),
        const SizedBox(
          height: 15,
        ),
        _textDescription("Дата рождения", "19.08.1967")
      ],
    );
  }

  _textDescription(String title, content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            title,
            style: miniTitle,
          ),
        ),
        Container(
          child: Text(content, style: text),
        )
      ],
    );
  }
}
