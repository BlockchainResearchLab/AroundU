import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/constants.dart';

class WorkerJobDetails extends StatefulWidget {
  const WorkerJobDetails({Key? key}) : super(key: key);

  @override
  State<WorkerJobDetails> createState() => _WorkerJobDetailsState();
}

class _WorkerJobDetailsState extends State<WorkerJobDetails> {
  @override
  Widget build(BuildContext context) {
    return ProviderNameCard(
      providerName: "Harsh",
      jobDescription: "lorem lorem lorem lorem lorem lorem",
    );
  }
}

class ProviderNameCard extends StatefulWidget {
  const ProviderNameCard(
      {Key? key, required this.providerName, required this.jobDescription})
      : super(key: key);

  final String providerName;
  final String jobDescription;

  @override
  State<ProviderNameCard> createState() => _ProviderNameCardState();
}

class _ProviderNameCardState extends State<ProviderNameCard> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: SizedBox(
        width: 328 * fem,
        height: 120 * fem,
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
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: 80 * fem,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
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
                      widget.providerName,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 200 * fem,
                        child: Text(
                          widget.jobDescription,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inter(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
