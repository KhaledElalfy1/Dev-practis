import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileLoadingBody extends StatelessWidget {
  const ProfileLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16),

        //! Profile Picture (Shimmer)
        Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: const CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),

        //! Name
        _buildShimmerListTile(icon: Icons.person),
        const SizedBox(height: 16),

        //! Email
        _buildShimmerListTile(icon: Icons.email),
        const SizedBox(height: 16),

        //! Phone number
        _buildShimmerListTile(icon: Icons.phone),
        const SizedBox(height: 16),

        //! Address
        _buildShimmerListTile(icon: Icons.location_city),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildShimmerListTile({required IconData icon}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 16,
          width: double.infinity,
          color: Colors.white,
        ),
      ),
    );
  }
}
