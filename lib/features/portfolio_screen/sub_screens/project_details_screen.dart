import 'package:flutter/material.dart';
import '../../../exports.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FaIcon(
                  FontAwesomeIcons.xmark,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 1 — Screens Preview + dots (all inside WaveCarousel)
                    WaveCarousel(images: project.images),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 2 — Tag + Title
                          Text(
                            project.type.toUpperCase(),
                            style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                              fontSize: 12.fs,
                              color: Colors.greenAccent,
                              letterSpacing: 1.5,
                            ),
                          ),

                          6.ph,

                          Text(
                            project.title,
                            style: AppTextStyles.whiteW400S32PxStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              height: 1.15,
                            ),
                          ),

                          8.ph,

                          /// 3 — Description
                          Text(
                            project.description,
                            style: AppTextStyles.whiteW400S18PxStyle.copyWith(
                              color: Colors.white,
                              fontSize: 13.fs,
                              height: 1.5,
                            ),
                          ),

                          18.ph,

                          /// 4 — Problem / Solution / Impact
                          _storyItem(
                            title: "Problem",
                            text: project.problem!,
                            color: Colors.redAccent,
                          ),
                          10.ph,
                          _storyItem(
                            title: "Solution",
                            text: project.solution!,
                            color: Colors.lightBlue,
                          ),
                          10.ph,
                          _storyItem(
                            title: "Impact",
                            text: project.impact!,
                            color: Colors.greenAccent,
                          ),

                          20.ph,

                          /// 5 — Features
                          _sectionLabel('Features'),
                          8.ph,
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: project.features
                                .map((e) => _featureChip(e))
                                .toList(),
                          ),

                          16.ph,

                          /// 6 — Tech Stack
                          _sectionLabel('Tech Stack'),
                          8.ph,
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children:
                                project.tech.map((e) => _techChip(e)).toList(),
                          ),

                          28.ph,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 7 — CTA
            _CtaBar(project: project),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) => Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 9.fs,
          letterSpacing: 2.2,
          color: Colors.white24,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget _featureChip(String label) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white12),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 11.fs, color: Colors.white60),
        ),
      );

  Widget _techChip(String label) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0x447C3AED)),
          color: const Color(0x117C3AED),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 11.fs, color: Color(0xFFA78BFA)),
        ),
      );

  Widget _storyItem({
    required String title,
    required String text,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 3,
          height: 42,
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        10.pw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.fs,
                  letterSpacing: 1.5,
                ),
              ),
              3.ph,
              Text(
                text,
                style: AppTextStyles.whiteW400S18PxStyle.copyWith(
                  fontSize: 13.fs,
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── CTA Bar ───────────────────────────────────────────────────────────────────
class _CtaBar extends StatelessWidget {
  const _CtaBar({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: const BoxDecoration(
        color: Color(0xFF0A0A0F),
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Interested in something like this?',
            style: TextStyle(color: Colors.white38, fontSize: 11.fs),
          ),
          10.ph,
          // ── buttons: centered, natural width, not full-width ──
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                buttonText: 'Preview',
                textStyle: AppTextStyles.whiteW400S18PxStyle.copyWith(
                  fontSize: 13.fs,
                  color: Colors.white54,
                ),
                backgroundColor: Colors.transparent,
                borderWidth: 1,
                fontSize: 13.fs,
                horizontalPadding: 24,
                onPressed: () {
                  if (project.previewUrl != null) {
                    launchUrl(Uri.parse(project.previewUrl!));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Preview not available for this project.',
                          style: TextStyle(
                            fontSize: 12.fs,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              16.pw,
              AppButton(
                buttonText: "LET'S BUILD SOMETHING",
                textStyle: AppTextStyles.whiteW400S18PxStyle.copyWith(
                  fontSize: 13.fs,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: const Color(0xFF7C3AED),
                borderWidth: 0,
                fontSize: 13.fs,
                horizontalPadding: 24,
                onPressed: () {
                  launchUrl(
                    Uri.parse('https://wa.me/201288278807'),
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
