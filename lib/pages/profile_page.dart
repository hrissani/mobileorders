
import 'package:flutter/material.dart';
import 'package:mobileorders/pages/edit_profile_page.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/buttun.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarCustom(title: "Profile"),
            // /profileimage
            Container(
              child: _description(),
            ),
            CustomButton(
              text: "Редактировать профиль", 
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(_)=> EditProfile()));
              }
            )
          ],
        ),
      ),
    );
  }

  Widget _description(){
    return Column(
      children: [
        _textDescription("имя пользователя","Настя"),
        _textDescription("фамилия пользователя","Фамилия"),
        _textDescription("дата рождения","19.08.1967")
      ],
    );
  }
  _textDescription(String title, content){
    return Column(
      children: [
        Container(
          child: Text(title),
        ),
        Container(
          child: Text(content),
        )
      ],
    );
  }
}