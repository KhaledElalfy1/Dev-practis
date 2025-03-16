import 'package:dev_practice/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:dev_practice/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:dev_practice/features/profile/presentation/view/widgets/profile_loaded_body.dart';
import 'package:dev_practice/features/profile/presentation/view/widgets/profile_loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) =>
            current is ProfileLoading ||
            current is ProfileLoaded ||
            current is ProfileFailure,
        builder: (context, state) {
          return state.maybeWhen(
            profileLoading: () {
              return const ProfileLoadingBody();
            },
            profileLoaded: (userModel) {
              return ProfileLoadedBody(userModel: userModel);
            },
            profileFailure: (apiErrorModel) {
              return AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                title: const Text('Error'),
                content: Text(apiErrorModel.message ?? "An error occurred"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

