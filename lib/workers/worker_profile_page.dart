import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_sprint_hackathon/constants/constants.dart';
import 'package:tech_sprint_hackathon/constants/widgets/buttons.dart';

List<String> skillSet = [
  "Fan Repair",
  "A.C./Cooler Repair",
  "Motor Repair",
  "Bikes/Scooty ",
];

class WorkerProfilePage extends StatefulWidget {
  const WorkerProfilePage({super.key});

  @override
  State<WorkerProfilePage> createState() => _WorkerProfilePageState();
}

class _WorkerProfilePageState extends State<WorkerProfilePage> {
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
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 350,
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
                      const Placeholder(fallbackHeight: 100),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 30),
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
                        "Welcome, Name",
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
                  subtitle: const Text("name@gmail.com"),
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
                  subtitle: const Text("123456789"),
                  leading: const Icon(Icons.phone),
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                const ProviderHomePageEditableFields(
                  icon: Icon(Icons.location_on_rounded),
                  textBoxFieldTitle: "Address",
                ),
                const SizedBox(
                  height: 30,
                ),
                // ignore: prefer_const_constructors
                ProviderHomePageEditableFields(
                    suffixIcon: const Icon(Icons.arrow_drop_down_rounded),
                    icon: const Icon(Icons.description),
                    textBoxFieldTitle: "Skills",
                    textBoxFieldDesc: "Electrician"),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                FooterButton(
                  buttonName: "SUBMIT", pushToPage: () {}, //TODO
                )
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
      this.suffixIcon});

  final Icon? icon;
  final String? textBoxFieldTitle;
  final String? textBoxFieldDesc;
  final Icon? suffixIcon;

  @override
  State<ProviderHomePageEditableFields> createState() =>
      _ProviderHomePageEditableFieldsState();
}

class _ProviderHomePageEditableFieldsState
    extends State<ProviderHomePageEditableFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
