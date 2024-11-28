
import 'package:global_expert/export.dart';

class BuildEmptyProperty extends StatelessWidget {
  const BuildEmptyProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return    const FittedBox(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(64),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home_work_outlined,
                size: 54,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              Text(
                'No properties found',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Add new properties or adjust your filters',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}