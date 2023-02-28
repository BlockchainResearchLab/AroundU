import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tech_sprint_hackathon/Routes/routes.dart';
import 'package:tech_sprint_hackathon/maps/google_maps.dart';
import 'package:tech_sprint_hackathon/service-providers/provider_job_page.dart';
import 'package:tech_sprint_hackathon/services/job_create_api.dart';
import '../auth/profile_option.dart';
import '../auth/registration.dart';
import '../constants/constants.dart';

String? state;

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
  String? title;
  String? job_type;
  String? job_location;
  String? description;
  int? price;

  @override
  void initState() {
    _startDate.text = "";
    _dueDate.text = "";
    super.initState();
    initializeDateFormatting();
  }

  final _validationKey = GlobalKey<FormState>();
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Logging in..."),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
                            onChanged: (value) {
                              setState(() {
                                title = value;
                              });
                            },
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
                        DropdownButton(
                          value: job_type,
                          elevation: 12,
                          hint: const Text(
                            'Select Job Type',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          iconEnabledColor: Colors.black,
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          items: const [
                            DropdownMenuItem(
                              value: "Electrician",
                              child: Text("Electrician"),
                            ),
                            DropdownMenuItem(
                              value: "Plumber",
                              child: Text("Plumber"),
                            ),
                            DropdownMenuItem(
                              value: "Mechanic",
                              child: Text("Mechanic"),
                            ),
                            DropdownMenuItem(
                              value: "Carpenter",
                              child: Text("Carpenter"),
                            ),
                            DropdownMenuItem(
                              value: "Wiring",
                              child: Text("Wiring"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              job_type = value;
                            });
                            if (kDebugMode) {
                              print(value);
                            }
                          },
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.45,
                        //   padding: const EdgeInsets.all(10),
                        //   child: TextFormField(
                        //     controller: _jobTypeController,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         job_type = value;
                        //       });
                        //     },
                        //     decoration: InputDecoration(
                        //       hintStyle: GoogleFonts.inter(
                        //         color: const Color(0xff565656),
                        //       ),
                        //       hintText: "Electrician",
                        //       focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
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
                          width: MediaQuery.of(context).size.width * 0.6,
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
                            onChanged: (value) {
                              setState(() {
                                state = value.toUpperCase();
                              });
                            },
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.inter(
                                color: const Color(0xff565656),
                              ),
                              hintText: "HIGH",
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
                            onChanged: (value) {
                              setState(() {
                                job_location = value;
                              });
                            },
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
                      onChanged: (value) {
                        setState(() {
                          description = value;
                        });
                      },
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
                            onChanged: (value) {
                              setState(() {
                                price = int.parse(value);
                              });
                            },
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.inter(
                                color: const Color(0xff565656),
                              ),
                              hintText: "₹",
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
                    // 28.5388565 , 77.2552762
                    height: 25,
                  ),
                  SubmitButton(submitFunction: () async {
                    log({
                      "title": title,
                      "description": description,
                      "type": description,
                      "price": price,
                      "latitude": "dummy",
                      "longitude": "dummy",
                      "state": state,
                      "due_date": dueDate,
                      "start_date": startDate,
                    }.toString());
                    log(email.toString());
                    log(token.toString());
                    await createJob(
                      description: description!,
                      due_date: dueDate!,
                      email: email!,
                      latitude: "35.12478",
                      longitude: "78.12457",
                      price: price!,
                      start_date: startDate!,
                      state: state!,
                      title: title!,
                      token: token!,
                      type: job_type!,
                    )
                        .onError((error, stackTrace) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Job not posted"))))
                        .whenComplete(() => ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                                content: Text("Job Created test 103"))))
                        .whenComplete(() => Navigator.pushReplacementNamed(
                            context, ProviderRoutes.ProviderRoutingPage));

                    // setState(() {
                    //   isEmptyProvider = false;
                    // });
                    // Navigator.pushReplacementNamed(
                    //     context, ProviderRoutes.ProviderRoutingPage);

                    // Future.delayed(Duration(seconds: 5), () {
                    //   return showLoaderDialog(context);
                    // });
                    // Navigator.pushReplacementNamed(
                    //     context, ProviderRoutes.ProviderRoutingPage);
                  }),
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
  const SubmitButton({Key? key, required this.submitFunction})
      : super(key: key);
  final VoidCallback? submitFunction;

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
          onPressed: widget.submitFunction,
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
