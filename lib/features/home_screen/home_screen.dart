import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.onScrollDown});

  final void Function()? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: Sizes.isLargeDesktop(context) || Sizes.isDesktop(context) ? 40 : 20, top: Sizes.isLargeDesktop(context) ? 40 : 0),
            child: MediaQuery.of(context).size.width < 780
                ? Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      context.width.pw,
                      _buildPhoto(context),
                      PositionedDirectional(
                        start: 0,
                        bottom: 0,
                        child: _buildNameSection(context),
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: Sizes.isLargeDesktop(context) ? 3 : 2,
                        child: _buildNameSection(context),
                      ),
                      12.pw,
                      Expanded(
                        flex: Sizes.isLargeDesktop(context) ? 2 : 1,
                        child: _buildPhoto(context),
                      ),
                    ],
                  ),
          ),
        ),
        context.width > 1080
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 40, end: 60, bottom: 20, top: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Companies I've Worked With as a Developer
                    DeveloperCompaniesWidget(),
                    16.pw,
                    ScrollWidget(onScrollDown: onScrollDown),
                    16.pw,
                    // Companies I've Worked With as an Instructor
                    InstructorCompaniesWidget(),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 20, end: 40, bottom: 20, top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Companies I've Worked With as a Developer
                    DeveloperCompaniesWidget(),
                    24.ph,
                    // Companies I've Worked With as an Instructor
                    InstructorCompaniesWidget(onScrollDown: onScrollDown),
                  ],
                ),
              ),
      ],
    );
  }
}

final String aboutMeText =
    ', building high-performance Flutter apps with clean architecture, smooth user experiences, and scalable solutions for startups, businesses, and real users.';

Widget _buildPhoto(BuildContext context) {
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return const LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        colors: [Colors.white, Colors.transparent],
      ).createShader(bounds);
    },
    blendMode: BlendMode.dstIn,
    child: Assets.images.myPhoto.image(
      height: Sizes.isLargeDesktop(context)
          ? 550
          : Sizes.isDesktop(context)
              ? 450
              : Sizes.isTablet(context)
                  ? 380
                  : 280,
      fit: BoxFit.fitHeight,
    ),
  );
}

Widget _buildNameSection(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TypingText(
        text: "AHMED",
        style: AppTextStyles.whiteW200S54PxStyle.copyWith(letterSpacing: 3),
        milliseconds: 100,
      ),
      TypingText(
        text: "EL-ABBASY",
        style: AppTextStyles.whiteW800S48PxStyle.copyWith(letterSpacing: 4),
        milliseconds: 140,
      ),
      8.ph,
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: TypingText(
              text: 'FLUTTER DEVELOPER • SOFTWARE ENGINEER',
              style: AppTextStyles.blueW500S26PxStyle,
              milliseconds: 180,
            ),
          ),
          RiveAnimatedIcon(
            riveIcon: RiveIcon.device,
            width: 40,
            height: 50,
            color: Colors.lightBlue,
            strokeWidth: 3,
            loopAnimation: true,
            onTap: () {},
            onHover: (value) {},
          ),
        ],
      ),
      28.ph,
      FadeIn(
        duration: const Duration(milliseconds: 900),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Building high-performance Flutter apps',
              style: AppTextStyles.whiteW400S18PxStyle
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            8.ph,
            Text('with clean architecture and smooth UX',
                style: AppTextStyles.whiteW400S18PxStyle),
            8.ph,
            Text(
              'for startups, businesses, and real users',
              style: AppTextStyles.whiteW400S18PxStyle
                  .copyWith(color: Colors.lightBlue),
            ),
          ],
        ),
      ),
    ],
  );
}
