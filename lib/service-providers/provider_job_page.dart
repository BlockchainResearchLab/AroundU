import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import '../constants/constants.dart';

bool isEmptyProvider = true;

// ENUMS FOR STATUS & PRIORITY

enum Status { ACTIVE, INACTIVE, COMPLETED }

String state = "ACTIVE";

enum Priority { ULTRA_HIGH, HIGH, MEDIUM, LOW }

class ProviderJobPage extends StatefulWidget {
  const ProviderJobPage({Key? key}) : super(key: key);

  @override
  State<ProviderJobPage> createState() => _ProviderJobPageState();
}

class _ProviderJobPageState extends State<ProviderJobPage> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 2), () {
          setState(() {});
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
      child: isEmptyProvider == true
          ? const EmptyProviderJobScreen()
          : Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: ListView(
                  children: const [
                    JobPostCard(
                        heading: "DDDD",
                        status: "ACTIVE",
                        priority: "LOW",
                        date: "15/02/2023",
                        price: "280"),
                  ],
                ),
              ),
            ),
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
      required this.price})
      : super(key: key);

  final String heading;
  final String status;
  final String priority;
  final String date;
  final String price;

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
    ;
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
    return Padding(
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
                            "Status: ",
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
                            "Priority:",
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
                        "Due Date: ${widget.date}", // DATE
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
