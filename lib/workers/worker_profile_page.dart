import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_sprint_hackathon/Routes/routes.dart';
import 'package:tech_sprint_hackathon/auth/profile_option.dart';
import 'package:tech_sprint_hackathon/constants/constants.dart';
import 'package:tech_sprint_hackathon/constants/widgets/buttons.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

import '../auth/registration.dart';
import '../services/auth-api-service/worker_profile_api.dart';

List<String> tags = [];
List<String> options = [
  "Electrician",
  "Plumber",
  "Mechanic",
  "Carpenter",
  "Wiring"
];
String? name;
String? address;

void printTag() {
  for (var tag in tags) {
    log(tag);
  }
}

class WorkerProfilePage extends StatefulWidget {
  const WorkerProfilePage({super.key});

  @override
  State<WorkerProfilePage> createState() => _WorkerProfilePageState();
}

class _WorkerProfilePageState extends State<WorkerProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppTheme.primaryColor,
        systemNavigationBarColor: Colors.black,
      ),
    );
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 330,
                  decoration: const BoxDecoration(
                    color: Color(0xff0476ff),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(42),
                      bottomRight: Radius.circular(42),
                    ),
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Image.asset(
                        ImageLink.mLogoWhite,
                        scale: 3,
                        height: 50.55,
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 50),
                      // ignore: prefer_const_constructors

                      const CircleAvatar(
                        minRadius: 20,
                        maxRadius: 70,
                        // ignore: sort_child_properties_last
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Welcome, $name",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xff8f8f8f),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Text("Email"),
                  subtitle: Text(email.toString()),
                  leading: const Icon(Icons.email),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xff8f8f8f),
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  title: const Text("Phone Number"),
                  subtitle: Text(phone.toString()),
                  leading: const Icon(Icons.phone),
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                ProviderHomePageEditableFields(
                    icon: Icon(Icons.account_circle_rounded),
                    controller: nameController,
                    textBoxFieldTitle: "Name",
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    }),
                SizedBox(
                  height: 30,
                ),
                ProviderHomePageEditableFields(
                  controller: addressController,
                  icon: Icon(Icons.location_on_rounded),
                  textBoxFieldTitle: "Address",
                  onChanged: (value) {
                    address = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                // ignore: prefer_const_constructors

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Choose your Skills:",
                  style: GoogleFonts.inter(
                    color: Color(0xff8f8f8f),
                    fontSize: 20,
                  ),
                ),
                Column(
                  children: [
                    ChipsChoice.multiple(
                      wrapped: true,
                      textDirection: TextDirection.rtl,
                      value: tags,
                      onChanged: (val) {
                        setState(() => tags = val);
                        printTag();
                      },
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: options,
                        value: (i, v) => v,
                        label: (i, v) => v,
                      ),
                      choiceStyle: C2ChoiceStyle(
                          color: Color(0xff1c1c1c),
                          borderRadius: BorderRadius.circular(5)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FooterButton(
                  buttonName: "SUBMIT",
                  pushToPage: () async {
                    var responseFromBack =
                        await workerDetails(name!, address!, tags);
                    if (responseFromBack != null) {
                      Future.delayed(Duration(seconds: 1), () {
                        return ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "Your profile as $profile is created.")));
                      });
                      Navigator.pushReplacementNamed(
                          context, WorkerRoutes.WorkersRoutingPage);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error Ocurred")));
                    }
                  }, //TODO
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProviderHomePageNonEditFields extends StatelessWidget {
  const ProviderHomePageNonEditFields(
      {super.key,
      required this.leadingIcon,
      required this.fieldTitle,
      required this.fieldSubtitle});

  final Icon leadingIcon;
  final String fieldTitle;
  final String fieldSubtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: const EdgeInsets.all(10),
      leading: leadingIcon,
      subtitle: Text(
        fieldSubtitle,
        style: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w200,
          color: const Color(0xff8f8f8f),
        ),
      ),
      title: Text(
        fieldTitle,
        style: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: const Color(0xff8f8f8f),
        ),
      ),
    );
  }
}

class ProviderHomePageEditableFields extends StatefulWidget {
  const ProviderHomePageEditableFields(
      {super.key,
      this.icon,
      this.textBoxFieldTitle,
      this.textBoxFieldDesc,
      this.suffixIcon,
      this.controller,
      this.onChanged});

  final Icon? icon;
  final String? textBoxFieldTitle;
  final String? textBoxFieldDesc;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  State<ProviderHomePageEditableFields> createState() =>
      _ProviderHomePageEditableFieldsState();
}

class _ProviderHomePageEditableFieldsState
    extends State<ProviderHomePageEditableFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xff8f8f8f)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        labelText: widget.textBoxFieldTitle,
        prefixIcon: widget.icon,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: const Color(0xff8f8f8f),
        hintMaxLines: 3,
        hintText: widget.textBoxFieldDesc,
        prefixIconColor: const Color(0xff8f8f8f),
      ),
    );
  }
}
