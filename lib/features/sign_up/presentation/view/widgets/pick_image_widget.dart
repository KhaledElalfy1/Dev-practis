import 'dart:io';

import 'package:dev_practice/features/sign_up/presentation/logic/cubit/sign_up_cubit.dart';
import 'package:dev_practice/features/sign_up/presentation/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => current is ProfilePicPicked,
      builder: (context, state) {
        return SizedBox(
          width: 130,
          height: 130,
          child: context.read<SignUpCubit>().profileImage == null
              ? CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: const AssetImage("assets/images/avatar.png"),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: context.read<SignUpCubit>().picImage,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Icon(
                              Icons.camera_alt_sharp,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : CircleAvatar(
                  child: Image.file(
                      File(context.read<SignUpCubit>().profileImage!.path)),
                ),
        );
      },
    );
  }
}
