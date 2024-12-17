import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/header_button.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideHeader();
          } else {
            return _buildNarrowHeader();
          }
        },
      ),
    );
  }

  Widget _buildWideHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _HeaderText(),
        // _HeaderActions(),
      ],
    );
  }

  Widget _buildNarrowHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeaderText(),
        SizedBox(height: 16),
        // _HeaderActions(),
      ],
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard Overview',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width > 600 ? 32 : 24,
            fontWeight: FontWeight.bold,
            color: kcSecondaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Welcome back, Admin! Here's what's happening today.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.width > 600 ? 16 : 14,
          ),
        ),
      ],
    );
  }
}

class _HeaderActions extends StatelessWidget {
  const _HeaderActions();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BuildHeaderButton(
          icon: Icons.file_download_outlined,
          tooltip: 'Export Report',
        ),
        SizedBox(width: 16),
        BuildHeaderButton(
          icon: Icons.notifications_outlined,
          tooltip: 'Notifications',
          hasNotification: true,
        ),
      ],
    );
  }
}
// import 'package:global_expert/export.dart';
// import 'package:global_expert/widgets/header_button.dart';

// class Header extends StatelessWidget {
//   const Header({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Dashboard Overview',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: kcSecondaryColor,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 "Welcome back, Admin! Here's what's happening today.",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               BuildHeaderButton(
//                 icon: Icons.file_download_outlined,
//                 tooltip: 'Export Report',
//               ),
//               SizedBox(width: 16),
//               BuildHeaderButton(
//                 icon: Icons.notifications_outlined,
//                 tooltip: 'Notifications',
//                 hasNotification: true,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
