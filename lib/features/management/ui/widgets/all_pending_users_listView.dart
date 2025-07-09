// ignore_for_file: camel_case_types, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/core/functions/formate_date.dart';
import 'package:untitled6/features/management/ui/manager/all_pending_users_cubit.dart';
import 'package:untitled6/features/management/ui/widgets/custom_pending_user_row.dart';


class AllPendingUsersListView extends StatelessWidget {
  const AllPendingUsersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllPendingUsersCubit, AllPendingUsersState>(
      builder: (context, state) {
        if (state is AllPendingUsersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllPendingUsersFailure) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else if (state is AllPendingUsersSuccess) {
          final users = state.allPendingUsersList;

          if (users.isEmpty) {
            return const Center(child: Text('No pending users found.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: users.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final user = users[index];
              return CustomPendingUserRow(
                email: user.email ?? 'No Email',
                date: formatDate(user.createdAt ?? ''),
                onAgree: () {
                  context.read<AllPendingUsersCubit>().approveUser(user.id!, context);
                },
                onReject: () {
                context.read<AllPendingUsersCubit>().rejectUser(user.id!, context);
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}


