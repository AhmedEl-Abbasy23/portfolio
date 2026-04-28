import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';


class ProjectCardWidget extends StatefulWidget {
  const ProjectCardWidget({
    super.key,
    this.project,
    this.number = 1,
  });

  final ProjectModel? project;
  final int number;

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.project != null
          ? () {
        context.push(
          ProjectDetailsScreen(project: widget.project!),
        );
      }
          : null,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.identity()
            ..scale(isHovered ? 1.05 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: isHovered ? 2 : 1,
              color: isHovered ? AppColors.primaryColor : Colors.white24,
            ),
            boxShadow: isHovered
                ? [
              BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: 0.3),
                blurRadius: 20,
              )
            ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: widget.project == null
                ? _numberCard()
                : _imageCard(),
          ),
        ),
      ),
    );
  }

  Widget _numberCard() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white.withValues(alpha: 0.04),
      child: Text(
        '${widget.number}',
        style: AppTextStyles.whiteW400S32PxStyle,
      ),
    );
  }

  Widget _imageCard() {
    return Stack(
      children: [
        Image.asset(
          widget.project!.coverImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: isHovered ? 1 : 0,
          child: Container(
            padding: EdgeInsets.all(12),
            color: Colors.black.withValues(alpha: 0.6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project!.title,
                  style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Mobile App',
                  style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                    color: AppColors.light3PrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}