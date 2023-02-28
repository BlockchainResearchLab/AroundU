import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_sprint_hackathon/auth/registration.dart';
import 'package:tech_sprint_hackathon/service-providers/provider_job_page.dart';
import 'package:tech_sprint_hackathon/services/jobDetailsForJobIDForProvider_api.dart';
import '../auth/profile_option.dart';
import '../constants/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../models/jobDetailForJobIDModel.dart';
import '../models/jobDetailsOfJobIDForProviderModel.dart';

bool isWorkerListEmpty = true;

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({Key? key}) : super(key: key);

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  JobDetailsForJobID jobDetailsForJobID = JobDetailsForJobID();
  late Future<JobDetailsOfJobIDForProvider?> fetch;
  @override
  void initState() {
    // TODO: implement initState
    fetch = jobDetailsForJobID.getDetailsForJobID(jobId, token!, email!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
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
      body: CustomRefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {});
            },
          );
        },
        builder: MaterialIndicatorDelegate(
          backgroundColor: AppTheme.primaryColor,
          builder: (context, controller) {
            return Image.asset(
              ImageLink.circle,
              scale: 7,
            );
          },
        ),
        child: FutureBuilder<JobDetailsOfJobIDForProvider?>(
            future: fetch,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.data!.workersDetails!.isEmpty) {
                  isWorkerListEmpty = true;
                } else {
                  isWorkerListEmpty = false;
                }
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Text(
                              snapshot.data!.jobDetails!.title.toString(),
                              style: GoogleFonts.inter(
                                  color: Colors.grey.shade600,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        JobDetailCard(
                          jobType: snapshot.data!.jobDetails!.type!.toString(),
                          jobLocation: "Govindpuram, GZB",
                          jobDescription: snapshot
                              .data!.jobDetails!.description!
                              .toString(),
                          startDate:
                              snapshot.data!.jobDetails!.startDate!.toString(),
                          dueDate:
                              snapshot.data!.jobDetails!.dueDate!.toString(),
                          priority:
                              snapshot.data!.jobDetails!.priority!.toString(),
                          price: snapshot.data!.jobDetails!.price!.toString(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18.0, horizontal: 20),
                              child: Text(
                                "Applied Workers",
                                style: GoogleFonts.inter(
                                    color: Colors.grey.shade600,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            isWorkerListEmpty == true
                                ? Text("No Applied Workers yet")
                                : const AppliedWorkerCard(
                                    workerFullName: "Janmejay Singh",
                                    workerExperience: "Nalla Chhapri Berozgaar",
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class JobDetailCard extends StatefulWidget {
  const JobDetailCard(
      {Key? key,
      required this.jobType,
      required this.startDate,
      required this.dueDate,
      required this.priority,
      required this.jobLocation,
      required this.jobDescription,
      required this.price})
      : super(key: key);

  final String jobType;
  final String startDate;
  final String dueDate;
  final String priority;
  final String jobLocation;
  final String jobDescription;
  final String price;

  @override
  State<JobDetailCard> createState() => _JobDetailCardState();
}

class _JobDetailCardState extends State<JobDetailCard> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    String? _priority;
    Color? priorityColor;
    switch (widget.priority) {
      case "LOW":
        setState(() {
          _priority = "Low";
          priorityColor = Colors.green;
        });
        break;
      case "MEDIUM":
        setState(() {
          _priority = "Medium";
          priorityColor = Colors.yellow.shade700;
        });
        break;
      case "HIGH":
        setState(() {
          _priority = "High";
          priorityColor = Colors.orange.shade700;
        });
        break;
      case "ULTRA_HIGH":
        setState(() {
          _priority = "Ultra High";
          priorityColor = Colors.red.shade900;
        });
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: SizedBox(
        width: 340 * fem,
        height: 710 * fem,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 9 * fem,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Job type:  ",
                        style: GoogleFonts.inter(
                          color: Colors.grey.shade600,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.jobType,
                        style: GoogleFonts.inter(
                            color: Colors.grey.shade400, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Start date:",
                        style: GoogleFonts.inter(
                          color: Colors.grey.shade600,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.startDate,
                        style: GoogleFonts.inter(
                            color: Colors.grey.shade400, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Due date:  ",
                        style: GoogleFonts.inter(
                          color: Colors.grey.shade600,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.dueDate,
                        style: GoogleFonts.inter(
                            color: Colors.grey.shade400, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Text(
                        "Priority:",
                        style: GoogleFonts.inter(
                          color: Colors.grey.shade600,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      Container(
                        width: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: priorityColor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Text(
                              _priority!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Job Location:  ",
                        style: GoogleFonts.inter(
                          color: Colors.grey.shade600,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 100 * fem,
                        child: Text(
                          widget.jobLocation,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inter(
                              color: Colors.grey.shade400, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Description:",
                        style: GoogleFonts.inter(
                          color: Colors.grey.shade600,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300 * fem,
                  child: Text(
                    widget.jobDescription,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                        color: Colors.grey.shade400, fontSize: 17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Price:",
                        style: GoogleFonts.inter(
                          color: Colors.grey.shade600,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        ImageLink.priceTag,
                        scale: 4,
                      ),
                      Text(
                        "   ₹ ${widget.price}", // PRICE
                        style: GoogleFonts.inter(
                          color: AppTheme.primaryColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppliedWorkerCard extends StatefulWidget {
  const AppliedWorkerCard(
      {Key? key, required this.workerFullName, required this.workerExperience})
      : super(key: key);

  final String workerFullName;
  final String workerExperience;

  @override
  State<AppliedWorkerCard> createState() => _AppliedWorkerCardState();
}

class _AppliedWorkerCardState extends State<AppliedWorkerCard> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: SizedBox(
        width: 340 * fem,
        height: 200 * fem,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 9 * fem,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 11.0),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 45 * fem,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Image.asset(
                              ImageLink.iconImage,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.workerFullName,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                width: 180 * fem,
                                child: Text(
                                  widget.workerExperience,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    CircularPercentIndicator(
                      radius: 25.0,
                      lineWidth: 4.0,
                      animation: true,
                      percent: 0.85,
                      center: Text(
                        "8.5",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: Colors.black),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppTheme.primaryColor,
                    ),
                  ],
                ),
                Row(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomisedButton(
                      buttonFunction: () {},
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      borderSideColor: Colors.green,
                      childWidget: Text(
                        "Accept",
                        style: GoogleFonts.inter(
                            fontSize: 25.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    CustomisedButton(
                      buttonFunction: () {},
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      borderSideColor: Colors.red,
                      childWidget: Text(
                        "Reject",
                        style: GoogleFonts.inter(
                            fontSize: 25.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    CustomisedButton(
                      buttonFunction: () {},
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey,
                      borderSideColor: Colors.blueGrey.shade500,
                      childWidget: Image.asset(
                        ImageLink.chatImage,
                        scale: 4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomisedButton extends StatefulWidget {
  const CustomisedButton(
      {Key? key,
      required this.buttonFunction,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.borderSideColor,
      required this.childWidget})
      : super(key: key);
  final VoidCallback? buttonFunction;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderSideColor;
  final Widget childWidget;

  @override
  State<CustomisedButton> createState() => _CustomisedButtonState();
}

class _CustomisedButtonState extends State<CustomisedButton> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        height: 50 * fem,
        child: ElevatedButton(
          onPressed: widget.buttonFunction,
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
            elevation: 5.0,
            foregroundColor: widget.foregroundColor,
            backgroundColor: widget.backgroundColor,
            shadowColor: widget.borderSideColor,
            side: BorderSide(color: widget.borderSideColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: widget.childWidget,
        ),
      ),
    );
  }
}
