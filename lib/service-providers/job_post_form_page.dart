import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tech_sprint_hackathon/Routes/routes.dart';
import '../constants/constants.dart';

class JobFormPage extends StatefulWidget {
  const JobFormPage({Key? key}) : super(key: key);

  @override
  State<JobFormPage> createState() => _JobFormPageState();
}

class _JobFormPageState extends State<JobFormPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _jobTypeController = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _dueDate = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _jobLocation = TextEditingController();

  String? startDate;
  String? dueDate;

  @override
  void initState() {
    _startDate.text = "";
    _dueDate.text = "";
    super.initState();
    initializeDateFormatting();
  }

  final _validationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: 150,
              child: Image.asset(ImageLink.mLogo),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Form(
              key: _validationKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fill the Job Details:",
                    style: GoogleFonts.inter(
                        fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Title:",
                          style: GoogleFonts.inter(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.inter(
                                color: const Color(0xff565656),
                              ),
                              hintText: "Electric Fan",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Job Type:",
                          style: GoogleFonts.inter(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _jobTypeController,
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.inter(
                                color: const Color(0xff565656),
                              ),
                              hintText: "Electrician",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Start Date:",
                          style: GoogleFonts.inter(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (startDate) {
                              if (startDate!.isEmpty) {
                                return "Please enter the date!";
                              }
                              return null;
                            },
                            controller: _startDate,
                            decoration: InputDecoration(
                              label: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Enter Start Date",
                                    style: GoogleFonts.inter(),
                                  ),
                                  const Icon(Icons.arrow_drop_down_sharp),
                                ],
                              ),
                              iconColor: Colors.black,
                              icon: const Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                              ),
                              // labelText: "Enter From Date",
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: const ColorScheme.dark(
                                            onPrimary: Colors.black,
                                            // selected text color
                                            onSurface: Colors.blue,
                                            // default text color
                                            primary: Colors.blue // circle color
                                            ),
                                        dialogBackgroundColor: Colors.black,
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.blue,
                                            textStyle: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                fontFamily: 'Inter'),
                                            // color of button's letters
                                            backgroundColor: Colors.black54,
                                            // Background color
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now());

                              if (pickedDate != null) {
                                log("Picked date : $pickedDate");

                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);

                                log("Formatted Date : $formattedDate");

                                setState(
                                  () {
                                    startDate = formattedDate;
                                    _startDate.text = startDate!;
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Due Date:",
                          style: GoogleFonts.inter(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (startDate) {
                              if (startDate!.isEmpty) {
                                return "Please enter the date!";
                              }
                              return null;
                            },
                            controller: _dueDate,
                            decoration: InputDecoration(
                              label: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Enter Start Date",
                                    style: GoogleFonts.inter(),
                                  ),
                                  const Icon(Icons.arrow_drop_down_sharp)
                                ],
                              ),
                              iconColor: Colors.black,
                              icon: const Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                              ),
                              // labelText: "Enter From Date",
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: const ColorScheme.dark(
                                            onPrimary: Colors.black,
                                            // selected text color
                                            onSurface: Colors.blue,
                                            // default text color
                                            primary: Colors.blue // circle color
                                            ),
                                        dialogBackgroundColor: Colors.black,
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.blue,
                                            textStyle: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                fontFamily: 'Inter'),
                                            // color of button's letters
                                            backgroundColor: Colors.black54,
                                            // Background color
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now());

                              if (pickedDate != null) {
                                log("Picked date : $pickedDate");

                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);

                                log("Formatted Date : $formattedDate");

                                setState(
                                  () {
                                    dueDate = formattedDate;
                                    _dueDate.text = dueDate!;
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "State:",
                          style: GoogleFonts.inter(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _state,
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.inter(
                                color: const Color(0xff565656),
                              ),
                              hintText: "High",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Job Location:",
                          style: GoogleFonts.inter(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _jobLocation,
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.inter(
                                color: const Color(0xff565656),
                              ),
                              hintText: "12/24 Karol Bagh",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.Maps),
                        child: Row(
                          children: const [
                            Text("Show on map"),
                            Icon(Icons.my_location)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Description:",
                          style: GoogleFonts.inter(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _description,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.inter(
                          color: const Color(0xff565656),
                        ),
                        hintText:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price:",
                          style: GoogleFonts.inter(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _price,
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.inter(
                                color: const Color(0xff565656),
                              ),
                              hintText: "₹ 280",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SubmitButton(logoutFunction: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatefulWidget {
  const SubmitButton({Key? key, required this.logoutFunction})
      : super(key: key);
  final VoidCallback? logoutFunction;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
      child: SizedBox(
        height: 50 * fem,
        child: ElevatedButton(
          onPressed: widget.logoutFunction,
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
            fixedSize: const Size(double.maxFinite, 50),
            elevation: 10.0,
            foregroundColor: Colors.white,
            backgroundColor: AppTheme.primaryColor,
            shadowColor: AppTheme.shadowColor,
            side: BorderSide(color: AppTheme.shadowColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "Submit",
            style:
                GoogleFonts.inter(fontSize: 25.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}