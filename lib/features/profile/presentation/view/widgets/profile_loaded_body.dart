
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_practice/features/profile/data/models/user_model.dart';
import 'package:flutter/material.dart';

class ProfileLoadedBody extends StatelessWidget {
  const ProfileLoadedBody({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        //! Profile Picture
        CircleAvatar(
          radius: 80,
          backgroundImage: CachedNetworkImageProvider(userModel.profilePic,),
        ),
        const SizedBox(height: 16),

        //! Name
         ListTile(
          title: Text(userModel.name),
          leading:const Icon(Icons.person),
        ),
        const SizedBox(height: 16),

        //! Email
         ListTile(
          title: Text(userModel.email),
          leading:const Icon(Icons.email),
        ),
        const SizedBox(height: 16),

        //! Phone number
         ListTile(
          title: Text(userModel.phone),
          leading:const Icon(Icons.phone),
        ),
        const SizedBox(height: 16),

        //! Address
         ListTile(
          title: Text(userModel.location.coordinates[0].toString()),
          leading:const Icon(Icons.location_city),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

