import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth/app/constands/inputstyle.dart';
import 'package:phone_auth/app/modules/home/controllers/home_controller.dart';
import 'package:phone_auth/app/modules/login/controllers/login_controller.dart';

class CustomTextfield extends TextFormField {
  HomeController homeController = Get.put(HomeController());
  @override
  TextEditingController? get controller => homeController.phoneController;

  @override
  FormFieldValidator<String>? get validator => (value) {
        if (value?.length != 10) {
          return "Enter a valid number";
        } else {
          return null;
        }
      };
  InputDecoration get decoration => InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        hintText: "Enter phone number",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: Colors.grey.shade600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black12),
        ),
      );
}
// TextFormField(

//                       keyboardType: TextInputType.number,
//                       cursorColor: Colors.purple,
//                       controller: phoneController,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           phoneController.text = value;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 5),
//                         hintText: "Enter phone number",
//                         hintStyle: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15,
//                           color: Colors.grey.shade600,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(color: Colors.black12),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(color: Colors.black12),
//                         ),
// prefixIcon: Container(
//   // alignment: Alignment.centerLeft,
//   padding: const EdgeInsets.only(top: 12.0, left: 4),
//   child: InkWell(
//     onTap: () {
//       showCountryPicker(
//           context: context,
//           countryListTheme: const CountryListThemeData(
//             bottomSheetHeight: 550,
//           ),
//           onSelect: (value) {
//             setState(() {
//               selectedCountry = value;
//             });
//           });
//     },
//     child: Text(
//       "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
//       style: const TextStyle(
//         fontSize: 18,
//         color: Colors.black,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// ),
//                         suffixIcon: phoneController.text.length == 10
//                             ? Container(
//                                 height: 30,
//                                 width: 30,
//                                 margin: const EdgeInsets.all(10.0),
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.green,
//                                 ),
//                                 child: const Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                               )
//                             : null,
//                       ),
//                     ),

class MobileNumberFeeld extends GetView<LoginController> {
  const MobileNumberFeeld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 18),
      child: TextFormField(
        validator: (value) {
          if (value?.length != 10) {
            return "Enter a valid number";
          } else {
            return null;
          }
        },
        controller: controller.mobileNumberController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.phone,
        decoration: AppInputDeceration.defalt.copyWith(
          hintText: 'Mobile Number',
          labelText: 'Mobile Number',
        ),
      ),
    );
  }
}
