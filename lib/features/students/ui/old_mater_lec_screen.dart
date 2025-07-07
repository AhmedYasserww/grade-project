import 'package:flutter/material.dart';
import 'package:untitled6/core/network/download_and_open_file.dart';
import 'package:untitled6/core/resource_manager/app_color.dart';
import 'package:untitled6/features/students/data/model/all_material_model/AllMaterialModel.dart';
import 'package:untitled6/features/students/ui/widgets/old_material_container.dart';

class OldLectureScreen extends StatelessWidget {
  final AllMaterialModel material;

  const OldLectureScreen({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: const Color(0xff022D4F),
            ),
            Expanded(child: Container(color: Colors.white)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Row(
              children: [
                const SizedBox(width: 50),
                Container(
                  width: 33,
                  height: 33,
                  decoration: BoxDecoration(
                      color: const Color(0xffDEDEDE),
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios,
                          color: AppColor.dark_blue)),
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    const Text(
                      'Old Material ',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("${material.title}", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ],
                ),
              ],
            ),
           const SizedBox(height: 70),
            Center(
              child: GestureDetector(
                onTap: () {
                  downloadAndOpenFile(context,material.materialLink ?? "");
                },
                child: OldMaterialsContainers(
                  filename: material.materialName ?? "Untitled",
                  icon: Icons.file_present,
                ),
              ),
            ),

          ],
        ),
      ]),
    );
  }
}
