import 'package:global_expert/export.dart';

class MyLayout extends StatefulWidget {
  final Widget child;
  const MyLayout({super.key, required this.child});

  @override
  State<MyLayout> createState() => _MyLayoutState();
}

class _MyLayoutState extends State<MyLayout> {
  final List<NavItem> navItems = [
    NavItem(
      icon: Icons.dashboard_outlined,
      title: 'Dashboard',
      route: '/dashboard',
    ),
    NavItem(
      icon: Icons.people_outline,
      title: 'User Management',
      route: '/users',
    ),
    NavItem(
      icon: Icons.apartment_outlined,
      title: 'Properties',
      route: '/properties',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final String currentRoute = Get.currentRoute;
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: _buildLogoSection(isMobile),
        centerTitle: false,
        actions: isMobile
            ? [
                IconButton(
                  icon: const Icon(Icons.person_outline, color: kcPrimaryColor),
                  onPressed: () {
                    // Show profile modal or navigate to profile
                    _showProfileModal(context);
                  },
                ),
              ]
            : null,
      ),
      drawer: isMobile
          ? Drawer(
              backgroundColor: kcBackgroundColor,
              child: Column(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person_outline,
                              color: kcPrimaryColor, size: 40),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Admin User',
                          style: TextStyle(
                            color: kcPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: navItems.length,
                      itemBuilder: (context, index) {
                        final item = navItems[index];
                        return _buildNavItem(
                          item.icon,
                          item.title,
                          item.route == currentRoute,
                          onTap: () {
                            Get.back(); // Close drawer
                            Get.toNamed(item.route);
                          },
                        );
                      },
                    ),
                  ),
                  // _buildDrawerProfileSection(),
                ],
              ),
            )
          : null,
      body: Row(
        children: [
          if (!isMobile) ...[
            Container(
              width: 280,
              color: Colors.white,
              child: Column(
                children: [
                  verticalSpaceMedium,
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: navItems.length,
                      itemBuilder: (context, index) {
                        final item = navItems[index];
                        return _buildNavItem(
                          item.icon,
                          item.title,
                          item.route == currentRoute,
                          onTap: () => Get.toNamed(item.route),
                        );
                      },
                    ),
                  ),
                  _buildProfileSection(),
                ],
              ),
            ),
          ],
          Expanded(child: widget.child),
        ],
      ),
      // bottomNavigationBar: isMobile
      //     ? BottomNavigationBar(
      //         currentIndex: _getCurrentIndex(currentRoute),
      //         onTap: (index) => Get.toNamed(navItems[index].route),
      //         items: navItems
      //             .map((item) => BottomNavigationBarItem(
      //                   icon: Icon(item.icon),
      //                   label: item.title,
      //                 ))
      //             .toList(),
      //         selectedItemColor: kcPrimaryColor,
      //         unselectedItemColor: Colors.grey,
      //       )
      //     : null,
    );
  }

  int _getCurrentIndex(String currentRoute) {
    return navItems.indexWhere((item) => item.route == currentRoute);
  }

  Widget _buildLogoSection(bool isMobile) {
    if (isMobile) {
      return Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.real_estate_agent,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Pakashiyana',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kcPrimaryColor,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kcPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.real_estate_agent,
            color: Colors.white,
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PropertyAdmin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kcPrimaryColor,
              ),
            ),
            Text(
              'Management Portal',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String title,
    bool isSelected, {
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? kcPrimaryColor : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? kcPrimaryColor : Colors.grey[800],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
      selected: isSelected,
      selectedTileColor: kcPrimaryColor.withOpacity(0.1),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: kcPrimaryColor,
            child: Icon(Icons.person_outline, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin User',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Super Admin',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // Widget _buildDrawerProfileSection() {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: const BoxDecoration(
  //       border: Border(
  //         top: BorderSide(color: Colors.grey, width: 0.2),
  //       ),
  //     ),
  //     child: ListTile(
  //       leading: const Icon(Icons.settings_outlined),
  //       title: const Text('Settings'),
  //       onTap: () {
  //         // Handle settings
  //       },
  //     ),
  //   );
  // }

  void _showProfileModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: kcPrimaryColor,
              child: Icon(Icons.person_outline, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 16),
            const Text(
              'Admin User',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Super Admin',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String title;
  final String route;

  NavItem({
    required this.icon,
    required this.title,
    required this.route,
  });
}
// import 'package:global_expert/export.dart';

// class MyLayout extends StatefulWidget {
//   final Widget child;
//   const MyLayout({super.key, required this.child});

//   @override
//   State<MyLayout> createState() => _MyLayoutState();
// }

// class _MyLayoutState extends State<MyLayout> {
//   int? hoveredIndex;

//   // Define navigation items with their routes
//   final List<NavItem> navItems = [
//     NavItem(
//       icon: Icons.dashboard_outlined,
//       title: 'Dashboard',
//       route: '/dashboard',
//     ),
//     NavItem(
//       icon: Icons.people_outline,
//       title: 'User Management',
//       route: '/users',
//     ),
//     NavItem(
//       icon: Icons.apartment_outlined,
//       title: 'Properties',
//       route: '/properties',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // Get current route to determine selected item
//     final String currentRoute = Get.currentRoute;

//     return Scaffold(
//       body: Row(
//         children: [
//           Container(
//             width: 280,
//             color: Colors.white,
//             child: Column(
//               children: [
//                 // Logo Section
//                 _buildLogoSection(),
//                 verticalSpaceMedium,

//                 // Navigation Section
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     itemCount: navItems.length,
//                     itemBuilder: (context, index) {
//                       final item = navItems[index];
//                       return _buildNavItem(
//                         item.icon,
//                         item.title,
//                         item.route == currentRoute,
//                         onTap: () => Get.toNamed(item.route),
//                       );
//                     },
//                   ),
//                 ),

//                 // Profile Section
//                 _buildProfileSection(),
//               ],
//             ),
//           ),
//           Expanded(child: widget.child),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(
//     IconData icon,
//     String title,
//     bool isSelected, {
//     required VoidCallback onTap,
//   }) {
//     final isHovered = hoveredIndex == title.hashCode;

//     return MouseRegion(
//       onEnter: (_) => setState(() => hoveredIndex = title.hashCode),
//       onExit: (_) => setState(() => hoveredIndex = null),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: isSelected
//               ? kcPrimaryColor
//               : isHovered
//                   ? kcPrimaryColor.withOpacity(0.1)
//                   : Colors.transparent,
//         ),
//         child: ListTile(
//           dense: true,
//           leading: Icon(
//             icon,
//             color: isSelected
//                 ? Colors.white
//                 : isHovered
//                     ? kcPrimaryColor
//                     : Colors.grey,
//           ),
//           title: Text(
//             title,
//             style: TextStyle(
//               color: isSelected
//                   ? Colors.white
//                   : isHovered
//                       ? kcPrimaryColor
//                       : Colors.grey[800],
//               fontWeight:
//                   isSelected || isHovered ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//           onTap: onTap,
//         ),
//       ),
//     );
//   }

//   Widget _buildLogoSection() {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: kcPrimaryColor,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Icon(
//               Icons.real_estate_agent,
//               color: Colors.white,
//               size: 28,
//             ),
//           ),
//           const SizedBox(width: 16),
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'PropertyAdmin',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: kcPrimaryColor,
//                 ),
//               ),
//               Text(
//                 'Management Portal',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProfileSection() {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF5F6FA),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             radius: 20,
//             backgroundColor: kcPrimaryColor,
//             child: Icon(Icons.person_outline, color: Colors.white),
//           ),
//           const SizedBox(width: 12),
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Admin User',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//                 Text(
//                   'Super Admin',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings_outlined),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Navigation item model
// class NavItem {
//   final IconData icon;
//   final String title;
//   final String route;

//   NavItem({
//     required this.icon,
//     required this.title,
//     required this.route,
//   });
// }
