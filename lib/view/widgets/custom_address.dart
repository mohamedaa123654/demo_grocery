import 'package:flutter/material.dart';
import '../../core/utils/color_manager.dart';

class CustomAddress extends StatelessWidget {
  String? text;

  CustomAddress({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 150,
          decoration: const BoxDecoration(
              color: ColorManager.address,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(7),
                topEnd: Radius.circular(70),
                bottomStart: Radius.circular(40),
                topStart: Radius.circular(40),
              )),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$text',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        const Expanded(
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 19,
            ),
          ),
        )
      ],
    );
  }
}
