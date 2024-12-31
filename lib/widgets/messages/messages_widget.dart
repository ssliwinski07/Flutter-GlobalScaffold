import 'package:flutter/material.dart';
import 'package:flutter_global_scaffold/helpers/helpers.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({
    super.key,
    required this.message,
    required this.infoMessageType,
    this.onTap,
  });

  final String message;
  final InfoMessageType infoMessageType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _getBackgroundColor(infoMessageType),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getIcon(infoMessageType),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Text(
                message,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(InfoMessageType infoMessageType) {
    switch (infoMessageType) {
      case InfoMessageType.info:
        return Colors.green;
      case InfoMessageType.warning:
        return Colors.orange;
      case InfoMessageType.error:
        return Colors.red;
    }
  }

  IconData _getIcon(InfoMessageType infoMessageType) {
    switch (infoMessageType) {
      case InfoMessageType.info:
        return Icons.check;
      case InfoMessageType.warning:
        return Icons.check;
      case InfoMessageType.error:
        return Icons.error_outline;
    }
  }
}
