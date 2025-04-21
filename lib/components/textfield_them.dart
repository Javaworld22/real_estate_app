import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class TextFieldThem {
  const TextFieldThem({Key? key});

  static buildTextFiled(
      BuildContext context, {
        required String hintText,
        required TextEditingController controller,
        TextInputType keyBoardType = TextInputType.text,
        ValueChanged<String>? onChanged,
        String? Function(String?)? validator,
        bool enable = true,
        int maxLine = 1,
        double? txtSize = 14,
        FontWeight? weight = FontWeight.w500,
        Color? txtColor = const Color(0xFF98A1B2),
        bool mRead = false,
        Color? body = whileColor60,
        String? Function(String?)? onSaved,
      }) {


    return TextFormField(
        readOnly: mRead,
        validator: validator,
        controller: controller,
        onSaved: onSaved,
        textAlign: TextAlign.start,
        enabled: enable,
        keyboardType: keyBoardType,
        maxLines: maxLine,
        onChanged: onChanged,
        cursorColor: primaryColor,
        contextMenuBuilder: (context, editableTextState) {
          final List<ContextMenuButtonItem> buttonItems =
              editableTextState.contextMenuButtonItems;
          buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
            return buttonItem.type == ContextMenuButtonType.cut;
          });
          return AdaptiveTextSelectionToolbar(
            anchors: editableTextState.contextMenuAnchors,
            //buttonItems: buttonItems,
            children: editableTextState.contextMenuButtonItems.map((ContextMenuButtonItem buttonItem) {
              return CupertinoButton(
                borderRadius: null,
                // color: Colors.blue, // Here you can change the background color
                // disabledColor: Colors.red,
                onPressed: buttonItem.onPressed,
                padding: const EdgeInsets.all(10.0),
                pressedOpacity: 0.7,
                child: SizedBox(
                  // width: 200.0,
                  child: Text(
                    style: const TextStyle(
                      color: Color(0xff0A0A0A),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.14,
                    ),
                    CupertinoTextSelectionToolbarButton.getButtonLabel(context, buttonItem),
                  ),
                ),
              );
            }).toList(),
          );
        },
        //style: GoogleFonts.manrope(color: Colors.black),
        decoration: InputDecoration(
            filled: true,
            fillColor: body,
            errorStyle: const TextStyle(
                color: Colors.redAccent),
            contentPadding: EdgeInsets.only(
                left: 10, right: 10, top: maxLine == 1 ? 0 : 10),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide:
              BorderSide(color: whileColor60, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: whileColor60, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide:
              BorderSide(color: whileColor60, width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide:
              BorderSide(color: whileColor60, width: 1),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide:
              BorderSide(color: whileColor60, width: 1),
            ),
            hintStyle: TextStyle(
              color: txtColor,
              fontSize: txtSize,
              fontFamily: 'roboto',
              fontWeight: weight,
              letterSpacing: 0.14,
            ),
            hintText: hintText));
  }

  static buildTextFiledWithPrefixIcon(BuildContext context,
      {required String hintText,
        required TextEditingController controller,
        required Widget prefix,
        TextInputType keyBoardType = TextInputType.text,
        bool enable = true,
        double? txtSize = 14,
        FontWeight? weight = FontWeight.w500,
        int maxLine = 1,
        Color? txtColor = const Color(0xFF98A1B2),
        ValueChanged<String>? onChanged}) {

    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      enabled: enable,
      keyboardType: keyBoardType,
      //style: GoogleFonts.manrope(color: Colors.black),
      onChanged: onChanged,
      cursorColor: primaryColor,
      //textInputAction: TextInputAction.newline,
      autofocus: false,
      maxLines: maxLine,
      // contextMenuBuilder: (context, editableTextState) {
      //   final List<ContextMenuButtonItem> buttonItems =
      //       editableTextState.contextMenuButtonItems;
      //   buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
      //     return buttonItem.type == ContextMenuButtonType.cut;
      //   });
      //   return AdaptiveTextSelectionToolbar.buttonItems(
      //     anchors: editableTextState.contextMenuAnchors,
      //     buttonItems: buttonItems,
      //   );
      // },
      contextMenuBuilder: (context, editableTextState) {
        final List<ContextMenuButtonItem> buttonItems =
            editableTextState.contextMenuButtonItems;
        buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
          return buttonItem.type == ContextMenuButtonType.cut;
        });
        return AdaptiveTextSelectionToolbar(
          anchors: editableTextState.contextMenuAnchors,
          //buttonItems: buttonItems,
          children: editableTextState.contextMenuButtonItems.map((ContextMenuButtonItem buttonItem) {
            return CupertinoButton(
              borderRadius: null,
             // color: Colors.blue, // Here you can change the background color
             // disabledColor: Colors.red,
              onPressed: buttonItem.onPressed,
              padding: const EdgeInsets.all(10.0),
              pressedOpacity: 0.7,
              child: SizedBox(
               // width: 200.0,
                child: Text(
                  style: const TextStyle(
                    color: Color(0xff0A0A0A),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.14,
                  ),
                  CupertinoTextSelectionToolbarButton.getButtonLabel(context, buttonItem),
                ),
              ),
            );
          }).toList(),
        );
      },
      decoration: InputDecoration(
        prefixIcon: prefix, // Your prefix icon widget
        prefixIconConstraints:
        const BoxConstraints(minWidth: 40), // Adjust the width as needed
        filled: true,
        fillColor: const Color(0xFFF7F7F7),
        contentPadding: const EdgeInsets.only(left: 10, right: 10),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: whileColor60, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: whileColor60, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: whileColor60, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: whileColor60, width: 1),
        ),
        hintStyle: TextStyle(
          color: txtColor,
          fontSize: txtSize,
          fontFamily: 'inter',
          fontWeight: weight,
          letterSpacing: 0.14,
        ),
        hintText: hintText,
      ),
    );
  }

}
