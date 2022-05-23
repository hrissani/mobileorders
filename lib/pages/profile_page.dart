
import 'package:flutter/material.dart';
import 'package:mobileorders/pages/edit_profile_page.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/buttun.dart';
import 'package:provider/provider.dart';

import '../bi/profile/profile.dart';
import '../bi/user/user_provider.dart';
import '../repository/repository.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarCustom(title: "Profile"),
            // /profileimage 
            _image(),
            Container(
              child: _description(Provider.of<UserProvider>(context, listen: false)),
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
 static const AssetImage imageProf = AssetImage('images/avatar.png');
  Widget _image(){
    // context.read<Profile>().getImageUrl()
    
    return Container(
      height: 56,
      width: 56,
      margin:
          EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: ImageIcon(
        imageProf,
        // IconsUpDesign.camera,
        // size: 24,
        color: Colors.grey,
      ),
    );
  }

  Widget _description(UserProvider providerUser){
    
    return Column(
      children: [
        _textDescription("имя пользователя","${providerUser.user}"),
        _textDescription("логин пользователя","${providerUser.email}"),
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