import 'package:flutter/material.dart';

class CustomPendingUserRow extends StatelessWidget {
  final String email;
  final String date;
  final VoidCallback onAgree;
  final VoidCallback onReject;

  const CustomPendingUserRow({
    super.key,
    required this.email,
    required this.date,
    required this.onAgree,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 180,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  email,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Color(0xFFB1B0B0),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            SizedBox(
              width: 180,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                 date,
                  style: const TextStyle(
                    color: Color(0xFFB1B0B0),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            const SizedBox(width: 12),

            GestureDetector(
              onTap: onAgree,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Agree",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),


            GestureDetector(
              onTap: onReject,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Reject",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
