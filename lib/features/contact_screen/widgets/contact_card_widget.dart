import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class ContactCardWidget extends StatefulWidget {
  const ContactCardWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<ContactCardWidget> createState() => ContactCardWidgetState();
}

class ContactCardWidgetState extends State<ContactCardWidget> {

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()
          ..translate(0.0, isHovered ? -6.0 : 0.0),
        child: InkWell(
          splashColor: Colors.blue.withValues(alpha: 0.2),
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onTap,
          child: Container(
            width: context.width > 800 ? 200 : context.width * 0.3,
            height: 140,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isHovered
                  ? Colors.white
                  : AppColors.whiteColor.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(16),
              boxShadow: isHovered
                  ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                )
              ]
                  : [],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  widget.icon,
                  size: 36,
                  color: _getColor(widget.icon),
                ),
                12.ph,
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.blackW700S14PxStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(IconData icon) {
    if (icon == FontAwesomeIcons.linkedin) return AppColors.urlColor;
    if (icon == FontAwesomeIcons.whatsapp) return Colors.green;
    return Colors.black;
  }
}