import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:tech_sprint_hackathon/auth/profile_option.dart';
import 'package:tech_sprint_hackathon/auth/registration.dart';
import 'package:tech_sprint_hackathon/service-providers/job_details.dart';
import '../constants/constants.dart';
import '../models/JobDetailsForProviderFeedModel.dart';
import '../services/jobDetailsForProviderAPI.dart';
import 'job_post_form_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

late String jobId = "";

class ProviderJobPage extends StatefulWidget {
  ProviderJobPage({Key? key}) : super(key: key);

  @override
  State<ProviderJobPage> createState() => _ProviderJobPageState();
}

class _ProviderJobPageState extends State<ProviderJobPage> {
  // @override
  // void initState() {
  //   setState(() {});
  //   // TODO: implement initState
  //   resGetJobsForProvider = getJobsForProvider(token!, email!);
  //   if (resGetJobsForProvider == null) {
  //     isEmptyProvider = true;
  //   } else {
  //     isEmptyProvider = false;
  //   }
  //   super.initState();
  // }

  JobDetails jobDetails = JobDetails();

  late Future<JobDetailsForProviderFeedModel> fetch;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch = jobDetails.getJobsForProvider(token!, email!);
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 2), () {
          // setState(() {
          //   resGetJobsForProvider = getJobsForProvider(token!, email!);
          // });
        });
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
      child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          body: FutureBuilder<JobDetailsForProviderFeedModel>(
            future: fetch,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return JobPostCard(
                      onTap: () {
                        setState(() {
                          jobId = snapshot.data!.data![index].sId
                              .toString(); //use this jobID to track the current tapped job tile.
                        });
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return JobDetailPage();
                          },
                        ));
                      },
                      price: snapshot.data!.data![index].price!.toString(),
                      heading: snapshot.data!.data![index].title!,
                      date: snapshot.data!.data![index].dueDate!,
                      priority: snapshot.data!.data![index].priority!,
                      status: snapshot.data!.data![index].status!,
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return EmptyProviderJobScreen();
              }
            },
          )),
    );
  }
}

class JobPostCard extends StatefulWidget {
  const JobPostCard(
      {Key? key,
      required this.heading,
      required this.status,
      required this.priority,
      required this.date,
      required this.price,
      required this.onTap})
      : super(key: key);

  final String heading;
  final String status;
  final String priority;
  final String date;
  final String price;
  final VoidCallback onTap;
  @override
  State<JobPostCard> createState() => _JobPostCardState();
}

class _JobPostCardState extends State<JobPostCard> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    String? _status;
    Color? statusColor;
    String? _priority;
    Color? priorityColor;
    switch (widget.status) {
      case "ACTIVE":
        setState(() {
          _status = "Active";
          statusColor = Colors.green;
        });
        break;
      case "COMPLETED":
        setState(() {
          _status = "Completed";
          statusColor = Colors.grey;
        });
        break;
      case "INACTIVE":
        setState(() {
          _status = "Inactive";
          statusColor = Colors.orange;
        });
        break;
    }
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
          priorityColor = Colors.yellow;
        });
        break;
      case "HIGH":
        setState(() {
          _priority = "High";
          priorityColor = Colors.orange;
        });
        break;
      case "ULTRA_HIGH":
        setState(() {
          _priority = "Ultra High";
          priorityColor = Colors.red;
        });
        break;
    }
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: SizedBox(
          width: 328 * fem,
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.heading,
                        style: GoogleFonts.inter(
                            fontSize: 28, fontWeight: FontWeight.w800),
                      ),
                      Image.asset(
                        ImageLink.bookmark,
                        scale: 4,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              // "Status: ",
                              AppLocalizations.of(context)!.status,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: statusColor,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4),
                                  child: Text(
                                    _status!,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.priority,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
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
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // "Due Date: ${widget.date}", // DATE
                          "${AppLocalizations.of(context)!.duedate} : ${widget.date}",
                          style: GoogleFonts.inter(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyProviderJobScreen extends StatefulWidget {
  const EmptyProviderJobScreen({Key? key}) : super(key: key);

  @override
  State<EmptyProviderJobScreen> createState() => _EmptyProviderJobScreenState();
}

class _EmptyProviderJobScreenState extends State<EmptyProviderJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
          ),
          Image.asset(
            ImageLink.providerEmptyScreen,
            scale: 1.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ],
      ),
    );
  }
}
