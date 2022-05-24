import 'package:flutter/material.dart';
import 'package:mobileorders/bi/orders/model_order.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/buttun.dart';

import '../assets/text_styles.dart';
import '../widgets/image_container.dart';
import 'catalog_write_data.dart';

class MoreInfoOrder extends StatelessWidget {
  final Order orderModel;
  const MoreInfoOrder({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const AppBarCustom(iconLeft: Icons.arrow_back_ios_new , title: "Подробнее"),
          const Spacer(),
          _content(orderModel),
          const Spacer(),
          CustomButton(
              text: "Заказать",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            SwriteDataOrder(orderModel: orderModel)));
              }),
              SizedBox(height: 20,)
        ]),
      ),
    );
  }

  Widget _content(Order orderModelW) {
    return Container(
      padding:const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.black)
      ),
      child: Column(
        children: [
          ImageCustomContainer(
            imageUrl: orderModel.urlImage
              ),
          Text(
            orderModel.title,
            style: title,
          ),
          Text(
            orderModel.miniDescription,
            style: description,
          ),
          Text(
            orderModel.description,
            style: description,
          ),
        ],
      ),
    );
  }
}
