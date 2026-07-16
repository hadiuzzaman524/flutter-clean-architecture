import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/cubit/device_status/device_status_cubit.dart';

class TimeLapseButton extends StatefulWidget {
  final ButtonStyle? style;
  final VoidCallback onPressed;
  final void Function(bool hover)? onHover;
  final Widget child;
  final bool enabled;
  final bool expanded;
  final bool internetRequired;

  const TimeLapseButton({
    super.key,
    this.style,
    this.onHover,
    this.enabled = true,
    this.expanded = true,
    this.internetRequired = false,
    required this.onPressed,
    required this.child,
  });

  @override
  State<TimeLapseButton> createState() => _TimeLapseButtonState();
}

class _TimeLapseButtonState extends State<TimeLapseButton> {
  static const _tapTimeLapse = 1000;

  int lastTimeClicked = 0;

  @override
  Widget build(BuildContext context) {
    final child = ElevatedButton(
      onHover: widget.onHover,
      onPressed: () {
        if (!widget.enabled) {
          return;
        }
        final now = DateTime.now().millisecondsSinceEpoch;
        if (lastTimeClicked + _tapTimeLapse > now) {
          return;
        }
        if (widget.internetRequired) {
          final state = context.read<DeviceStatusCubit>().state;
          if (!state.hasInternet) {
            return;
          }
        }
        lastTimeClicked = now;
        widget.onPressed();
      },
      style: widget.style,
      child: widget.child,
    );

    if (!widget.expanded) {
      return child;
    }

    return SizedBox(width: double.maxFinite, child: child);
  }
}
