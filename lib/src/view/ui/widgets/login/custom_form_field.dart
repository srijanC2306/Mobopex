import 'package:MoboPex/src/view/base_stateful_widget.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final String heading;
  final bool isPassword;
  final String? errorText;
  final String hintText;
  final bool isDateForm;

  final bool isWholeSeller;
  final bool isFileUpload;

  const CustomFormField(
      {required this.controller,
      required this.heading,
      required this.hintText,
      this.errorText = "Please enter correct value",
      this.isPassword = false,
      this.isDateForm = false,
      this.isFileUpload = false,
      required this.isWholeSeller,
      super.key});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {

  bool isPassword = false;
  String fileName = '';
  bool isDateForm = false;

  DateTime _selectedDate = DateTime.now();

  Future<void> _pickFiles() async {
    FilePickerResult? filePath = await FilePicker.platform.pickFiles();
    if (filePath != null) {
      setState(() {
        String? selectedFilePath = filePath.files.first.path;
        if (selectedFilePath != null) {
          // Extracting just the file name from the path
          List<String> pathParts = selectedFilePath.split('/');
          String fileName = pathParts.last;

          // Storing the file name in the text field
          widget.controller.text = fileName;

          // Storing the full path in fileName variable (optional)
          fileName = selectedFilePath;
        }
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = "${_selectedDate.toLocal()}".split(' ')[0];
        widget.controller.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
      });
    }
  }

  @override
  void initState() {
    isPassword = widget.isPassword;
    isDateForm = widget.isDateForm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: BaseTextStyle(
              color: widget.isWholeSeller ? Colors.black : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        Stack(
          children: [
            TextFormField(
              onTap: () {
                if (widget.isDateForm) {
                  _selectDate(context);
                } else {
                  return;
                }
              },
              readOnly: widget.isDateForm || widget.isFileUpload,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return widget.errorText;
                }
                return null;
              },
              controller: widget.controller,
              obscureText: isPassword,
              style: BaseTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: widget.isWholeSeller
                      ? ColorConstants.textColor
                      : Colors.white),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.isWholeSeller
                              ? ColorConstants.textColor
                              : Colors.white)),
                  labelStyle: BaseTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: widget.isWholeSeller
                          ? Colors.white
                          : ColorConstants.textColor),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.isWholeSeller
                              ? ColorConstants.textColor
                              : Colors.white)),
                  hintText: widget.hintText,
                  hintStyle: BaseTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: widget.isWholeSeller
                          ? ColorConstants.textColor
                          : Colors.white),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.isWholeSeller
                              ? ColorConstants.textColor
                              : Colors.white)),
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero),
            ),
            if (widget.isPassword)
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: Icon(
                      isPassword ? Icons.visibility : Icons.visibility_off,
                      color: widget.isWholeSeller
                          ? ColorConstants.primaryColor
                          : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                ),
              ),
            if (widget.isDateForm)
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: widget.isWholeSeller
                          ? ColorConstants.primaryColor
                          : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        //  isDateForm = !isDateForm ;
                        if (isDateForm) {
                          _selectDate(context);
                          // isDateForm = !isDateForm ;
                        }
                      });
                    },
                  ),
                ),
              ),
            if (widget.isFileUpload)
              Positioned(
                top: 0,
                right: -8,
                bottom: 0,
                child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () async {
                        await _pickFiles();
                      },
                      child: Container(
                        width: 80,
                        height: 200,
                        color: ColorConstants.fileUpload,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Choose File",
                              style: BaseTextStyle(
                                  color: widget.isWholeSeller
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
          ],
        ),
      ],
    );
  }
}
