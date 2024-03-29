import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_sprint_hackathon/auth/registration.dart';
import 'package:tech_sprint_hackathon/constants/constants.dart';
import 'package:tech_sprint_hackathon/constants/widgets/buttons.dart';
import 'package:tech_sprint_hackathon/services/auth-api-service/provider_profile_api.dart';

import '../Routes/routes.dart';
import '../auth/profile_option.dart';

String name="";
String? address;

class ProviderProfilePage extends StatefulWidget {
  const ProviderProfilePage({super.key});

  @override
  State<ProviderProfilePage> createState() => _ProviderProfilePageState();
}

class _ProviderProfilePageState extends State<ProviderProfilePage> {
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
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 330,
                decoration: const BoxDecoration(
                    color: Color(0xff0476ff),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(42),
                        bottomRight: Radius.circular(42))),
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
                            "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")),
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
              SizedBox(
                height: 20,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Color(0xff8f8f8f)),
                    borderRadius: BorderRadius.circular(15)),
                title: Text("Email"),
                subtitle: Text(email.toString()),
                leading: Icon(Icons.email),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Color(0xff8f8f8f)),
                    borderRadius: BorderRadius.circular(15)),
                title: Text("Phone Number"),
                subtitle: Text(phone.toString()),
                leading: Icon(Icons.phone),
              ),

              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              ProviderHomePageEdittableFields(
                controller: nameController,
                icon: Icon(Icons.account_circle_sharp),
                textBoxfieldtitle: "Name",
                textBoxfielddesc: "Tell us your name",
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              ProviderHomePageEdittableFields(
                controller: addressController,
                icon: Icon(Icons.location_on_rounded),
                textBoxfieldtitle: "City",
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              // ignore: prefer_const_constructors
              ProviderHomePageEdittableFields(
                icon: Icon(Icons.description),
                textBoxfieldtitle: "Description",
                textBoxfielddesc:
                    "It will be cherry on the top, if we know you",
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              FooterButton(
                  buttonName: "SUBMIT",
                  pushToPage: () async {
                    var responseFromBack = await providerDetails(name!);
                    if (responseFromBack != null) {
                      Future.delayed(Duration(seconds: 1), () {
                        return ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "Your profile as $profile is created.")));
                      });
                      Navigator.pushReplacementNamed(
                          context, ProviderRoutes.ProviderRoutingPage);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error Ocurred")));
                    }
                  }),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ],
      ),
    ));
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
          color: const Color(0x8f8f8f),
        ),
      ),
      title: Text(
        fieldTitle,
        style: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: const Color(0x8f8f8f),
        ),
      ),
    );
  }
}

class ProviderHomePageEdittableFields extends StatefulWidget {
  const ProviderHomePageEdittableFields(
      {super.key,
      this.icon,
      this.textBoxfieldtitle,
      this.textBoxfielddesc,
      this.controller,
      this.onChanged});
  final Icon? icon;
  final String? textBoxfieldtitle;
  final String? textBoxfielddesc;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  State<ProviderHomePageEdittableFields> createState() =>
      _ProviderHomePageEdittableFieldsState();
}

class _ProviderHomePageEdittableFieldsState
    extends State<ProviderHomePageEdittableFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xff8f8f8f)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: widget.textBoxfieldtitle,
          prefixIcon: widget.icon,
          hintMaxLines: 3,
          hintText: widget.textBoxfielddesc,
          prefixIconColor: Color(0xff8f8f8f)),
    );
  }
}
