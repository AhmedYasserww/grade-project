// uploads_screen_management.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/core/services/service_locator.dart';
import 'package:untitled6/features/doctors/ui/widgets/custom_1_8Pages%20_UploadScreen.dart';
import 'package:untitled6/features/doctors/ui/widgets/custom_TopBar_Welome_AddLectureScreen.dart';
import 'package:untitled6/features/management/data/repo/all_pending_users_repo_imp.dart';
import 'package:untitled6/features/management/ui/manager/all_pending_users_cubit.dart';
import 'package:untitled6/features/management/ui/widgets/all_pending_users_listView.dart';
import 'package:untitled6/features/management/ui/widgets/custom_name_table_in_management.dart';

class UploadsScreenManagemebt extends StatelessWidget {
  final String userName;

  const UploadsScreenManagemebt({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      AllPendingUsersCubit(getIt.get<AllPendingUsersRepoImp>())..fetchAllPendingUsers(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTopbarWelomeAddlecturescreen(text1: '👋 $userName'),
                    const SizedBox(height: 40),
                    const CustomNamestablesInUploadscreenManagement(),
                    Divider(color: Colors.grey.shade700),
                  ],
                ),
              ),
              const Expanded(child: AllPendingUsersListView()),
              const SizedBox(height: 16),
             // Optional footer()
              Custom_1_8_Pages(),
              Text("1 of 8 pages (84 items)", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}


