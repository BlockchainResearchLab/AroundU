import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import '../constants/constants.dart';

class WorkersFeedPage extends StatefulWidget {
  const WorkersFeedPage({Key? key}) : super(key: key);

  @override
  State<WorkersFeedPage> createState() => _WorkersFeedPageState();
}

class _WorkersFeedPageState extends State<WorkersFeedPage> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 2));
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
        backgroundColor: Colors.white,
        body: Center(
          // child: Text(
          //   "WORKER FEED PAGE",
          // ),
          child: ListView(
            children: const [
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
              JobFeedCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class JobFeedCard extends StatefulWidget {
  const JobFeedCard({Key? key}) : super(key: key);

  // final String heading;

  @override
  State<JobFeedCard> createState() => _JobFeedCardState();
}

class _JobFeedCardState extends State<JobFeedCard> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
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
                      "Designer",
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
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.green,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: Text(
                                  "Active",
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
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xfff99746),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: Text(
                                  "High",
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
                        "Due Date: 15/02/2023",
                        style: GoogleFonts.inter(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              ImageLink.priceTag,
                              scale: 4,
                            ),
                            Text(
                              "   ₹ 280",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
