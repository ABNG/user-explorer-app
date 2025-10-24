import 'package:flutter/material.dart';
import 'package:user_explorer/data/model/user_model.dart';

import '../widget/info_tile.dart';
import '../widget/section_title.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatarColor =
        Colors.primaries[user.name.hashCode % Colors.primaries.length];

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? 'User Detail'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Header
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: avatarColor.withValues(alpha: 0.2),
                        child: Text(
                          user.name?.substring(0, 1).toUpperCase() ?? '?',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name ?? 'Unknown User',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "@${user.username ?? 'username'}",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Contact Info
                  SectionTitle(title: 'Contact Information'),
                  const SizedBox(height: 8),
                  InfoTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: user.email,
                  ),
                  InfoTile(
                    icon: Icons.phone_outlined,
                    label: 'Phone',
                    value: user.phone,
                  ),
                  InfoTile(
                    icon: Icons.language_outlined,
                    label: 'Website',
                    value: user.website,
                  ),

                  const SizedBox(height: 24),

                  // Address
                  SectionTitle(title: 'Address'),
                  const SizedBox(height: 8),
                  InfoTile(
                    icon: Icons.home_outlined,
                    label: 'Street',
                    value: user.address?.street,
                  ),
                  InfoTile(
                    icon: Icons.location_city_outlined,
                    label: 'City',
                    value: user.address?.city,
                  ),
                  InfoTile(
                    icon: Icons.pin_drop_outlined,
                    label: 'Zipcode',
                    value: user.address?.zipcode,
                  ),

                  const SizedBox(height: 24),

                  // Company
                  SectionTitle(title: 'Company'),
                  const SizedBox(height: 8),
                  InfoTile(
                    icon: Icons.business_outlined,
                    label: 'Name',
                    value: user.company?.name,
                  ),
                  InfoTile(
                    icon: Icons.tips_and_updates_outlined,
                    label: 'Catch Phrase',
                    value: user.company?.catchPhrase,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
