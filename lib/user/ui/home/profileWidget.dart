import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/profileTextInput.dart';

Widget profileWidget(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController countryController,
    TextEditingController tokenController) {
  return SizedBox(
    width: Sizes.width,
    height: Sizes.height,
    child: SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(3),
          Container(
            height: Sizes.avatarSide * 2,
            width: Sizes.avatarSide * 2,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(Sizes.avatarSide)),
                image: const DecorationImage(
                    image: AssetImage("assets/demo/profile.png"),
                    fit: BoxFit.cover)),
          ),
          verticalSpace(4),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.padding, vertical: Sizes.boxSeparation / 2),
            width: Sizes.width - 2 * Sizes.padding,
            alignment: Alignment.centerLeft,
            child: Text(
              "Email",
              style: TextStyle(
                  color: const Color(0xff5F5F5F),
                  fontSize: Sizes.font08,
                  fontWeight: FontWeight.bold),
            ),
          ),
          profileTextInput(emailController),
          verticalSpace(),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.padding, vertical: Sizes.boxSeparation / 2),
            width: Sizes.width - 2 * Sizes.padding,
            alignment: Alignment.centerLeft,
            child: Text(
              "Teléfono",
              style: TextStyle(
                  color: const Color(0xff5F5F5F),
                  fontSize: Sizes.font08,
                  fontWeight: FontWeight.bold),
            ),
          ),
          profileTextInput(phoneController),
          verticalSpace(),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.padding, vertical: Sizes.boxSeparation / 2),
            width: Sizes.width - 2 * Sizes.padding,
            alignment: Alignment.centerLeft,
            child: Text(
              "País",
              style: TextStyle(
                  color: const Color(0xff5F5F5F),
                  fontSize: Sizes.font08,
                  fontWeight: FontWeight.bold),
            ),
          ),
          profileTextInput(countryController),
          verticalSpace(),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.padding, vertical: Sizes.boxSeparation / 2),
            width: Sizes.width - 2 * Sizes.padding,
            alignment: Alignment.centerLeft,
            child: Text(
              "Token de notificaciones",
              style: TextStyle(
                  color: const Color(0xff5F5F5F),
                  fontSize: Sizes.font08,
                  fontWeight: FontWeight.bold),
            ),
          ),
          profileTextInput(tokenController,heightFactor: 7),
          verticalSpace(3),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customButton(context, "Cancelar", () {
                  Navigator.of(context).pop();
                },
                    backgroundColor: const Color(0xff3075B6),
                    customWidth: Sizes.width * 0.35),
                customButton(context, "Guardar", () {
                  Navigator.of(context).pop();
                },
                    backgroundColor: const Color(0xff3075B6),
                    customWidth: Sizes.width * 0.35),
              ],
            ),
          ),
          verticalSpace(3),
        ],
      ),
    ),
  );
}
