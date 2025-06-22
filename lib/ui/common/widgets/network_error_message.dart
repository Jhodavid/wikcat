import 'package:flutter/material.dart';

import '../../../config/config.dart';

class NetworkErrorMessage extends StatelessWidget {

  final void Function()? onAction;

  const NetworkErrorMessage({
    super.key,
    this.onAction
  });

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            color: Colors.red.withOpacity(0.8),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Text(
              locale.breeds_network_error,
              style: textStylesTheme.bodyMedium,
            ),
          ),
          TextButton(
            onPressed: onAction,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  locale.breeds_refresh,
                  style: textStylesTheme.bodyMedium,
                ),
                const SizedBox(width: 5),
                const Icon(Icons.refresh_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}