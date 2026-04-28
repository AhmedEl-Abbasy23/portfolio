import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class PortfolioData {
  static const skills = [
    'Flutter',
    'Dart',
    'BLoC',
    'Firebase',
    'REST APIs',
    'Chat',
    'Maps',
    'Performance',
    'Clean Architecture',
  ];

  static const features = [
    'Voice & Video Calls',
    'Real-time Chat',
    'Push Notifications',
    'Maps & Tracking',
    'Dashboards',
    'Scalable Architecture',
  ];

  static const achievements = [
    'Delivered 20+ mobile apps across industries.',
    'Built 3 responsive websites.',
    'Created scalable, maintainable software.',
    'Integrated chat & call features.',
    'Collaborated with teams to ship products.',
    'Improved app performance for smooth UX.',
  ];

  static List<SvgGenImage> achievementsIcons = [
    Assets.icons.achievement1,
    Assets.icons.achievement2,
    Assets.icons.achievement3,
    Assets.icons.achievement4,
    Assets.icons.achievement5,
    Assets.icons.achievement6,
    Assets.icons.achievement7,
    Assets.icons.achievement8,
  ];

  static final List<String> platforms = [
    'LinkedIn',
    'GitHub',
    'Email',
    'WhatsApp',
  ];

  static final List<IconData> icons = [
    FontAwesomeIcons.linkedin,
    FontAwesomeIcons.github,
    FontAwesomeIcons.envelope,
    FontAwesomeIcons.whatsapp,
  ];

  static final List<AssetGenImage> imagesLocal = [
    Assets.images.cover1,
    Assets.images.cover2,
    Assets.images.cover3,
    Assets.images.cover4,
    Assets.images.cover5,
    Assets.images.cover6,
  ];

  static final List<String> cardsImages = [
    Assets.images.projectPlaceholder.path,
    Assets.images.screen1.path,
    Assets.images.screen2.path,
    Assets.images.screen3.path,
    Assets.images.cover1.path,
    Assets.images.cover2.path,
    Assets.images.cover3.path,
    Assets.images.cover4.path,
    Assets.images.cover5.path,
    Assets.images.cover6.path,
  ];

  static final List<ProjectPSI> projectsPSI = [
    ProjectPSI(
      problem: "Users struggled to track orders in real-time",
      solution: "Built a live tracking system using Firebase & Maps",
      impact: "Improved user engagement and reduced support requests by 40%",
    ),
    ProjectPSI(
      problem: 'Users had difficulty managing ...',
      solution: 'Built a system using Flutter that ...',
      impact: 'Increased efficiency and improved UX significantly',
    ),
    ProjectPSI(
      problem: 'Business needed a scalable mobile solution',
      solution: 'Developed a clean architecture Flutter app',
      impact: 'Enabled growth and handled thousands of users smoothly',
    ),

    // 25 new dummy entries
    ProjectPSI(
      problem: 'Customers could not easily browse products on mobile',
      solution: 'Designed a responsive e-commerce UI with Flutter & REST API',
      impact: 'Boosted mobile sales by 35% within the first quarter',
    ),
    ProjectPSI(
      problem: 'Team lacked a centralized tool for task management',
      solution: 'Created a Kanban-style project management app with Firestore',
      impact: 'Reduced missed deadlines by 50% across all departments',
    ),
    ProjectPSI(
      problem: 'Restaurant owners struggled to manage digital menus',
      solution: 'Built a dynamic menu management dashboard with Flutter Web',
      impact: 'Saved 3+ hours per week per restaurant on manual updates',
    ),
    ProjectPSI(
      problem: 'Students had no structured way to track learning progress',
      solution: 'Developed an LMS app with progress tracking and quizzes',
      impact: 'Improved course completion rates by 60%',
    ),
    ProjectPSI(
      problem: 'Healthcare clinic had no digital appointment booking system',
      solution:
          'Built a Flutter app integrated with a calendar & SMS notifications',
      impact: 'Reduced no-show appointments by 45%',
    ),
    ProjectPSI(
      problem: 'Delivery drivers had no optimized route planning tool',
      solution: 'Integrated Google Maps routing into a Flutter driver app',
      impact: 'Cut average delivery time by 25% and fuel costs by 18%',
    ),
    ProjectPSI(
      problem: 'Users lost important notes due to lack of cloud sync',
      solution:
          'Built a cross-platform notes app with real-time Firestore sync',
      impact: 'Achieved 4.8-star rating with zero data loss complaints',
    ),
    ProjectPSI(
      problem: 'Gym members had no way to book classes or track workouts',
      solution:
          'Developed a fitness app with class booking and progress charts',
      impact: 'Increased member retention by 30% in 6 months',
    ),
    ProjectPSI(
      problem: 'Small businesses lacked an affordable POS system',
      solution: 'Built a lightweight Flutter POS app with offline support',
      impact: 'Onboarded 200+ small businesses in the first month',
    ),
    ProjectPSI(
      problem:
          'Event organizers could not manage attendee check-ins efficiently',
      solution: 'Created a QR-based check-in app with real-time analytics',
      impact: 'Reduced check-in time from 5 minutes to under 30 seconds',
    ),
    ProjectPSI(
      problem:
          'Parents had no visibility into their children\'s school activities',
      solution: 'Developed a school communication app with push notifications',
      impact: 'Increased parent engagement by 70% school-wide',
    ),
    ProjectPSI(
      problem: 'Field technicians had no digital way to submit service reports',
      solution: 'Built an offline-first Flutter app with background sync',
      impact:
          'Eliminated paper reports and saved 4 hours per technician weekly',
    ),
    ProjectPSI(
      problem: 'Users struggled to split bills and track shared expenses',
      solution: 'Created a group expense tracker with smart split algorithms',
      impact: 'Resolved payment disputes and saved average users \$200/month',
    ),
    ProjectPSI(
      problem: 'Real estate agents had no mobile tool to showcase properties',
      solution: 'Built a property listing app with image galleries and filters',
      impact: 'Increased lead generation by 55% for partner agencies',
    ),
    ProjectPSI(
      problem:
          'Volunteers had no centralized platform to find local opportunities',
      solution:
          'Developed a community volunteering app with location-based search',
      impact: 'Connected 10,000+ volunteers with 500+ organizations',
    ),
    ProjectPSI(
      problem: 'Freelancers struggled to invoice clients and track payments',
      solution: 'Built an invoicing app with PDF export and payment reminders',
      impact: 'Helped freelancers recover 20% more unpaid invoices on average',
    ),
    ProjectPSI(
      problem: 'Travelers had difficulty organizing trip itineraries offline',
      solution: 'Developed a travel planner app with offline map caching',
      impact: 'Earned featured spot on App Store Travel category',
    ),
    ProjectPSI(
      problem: 'Pet owners forgot medication schedules for their animals',
      solution:
          'Built a pet care reminder app with custom notification scheduling',
      impact: 'Improved medication adherence by 80% among active users',
    ),
    ProjectPSI(
      problem:
          'Online tutors lacked a platform to manage sessions and payments',
      solution: 'Created a tutoring marketplace app with Stripe integration',
      impact: 'Facilitated over \$500K in tutor earnings within 6 months',
    ),
    ProjectPSI(
      problem: 'Warehouse staff had no digital inventory scanning system',
      solution:
          'Developed a barcode scanning inventory app using Flutter & ML Kit',
      impact: 'Reduced inventory errors by 90% and cut audit time in half',
    ),
    ProjectPSI(
      problem: 'NGO struggled to collect and manage donor information securely',
      solution: 'Built a donor management app with encrypted local storage',
      impact: 'Increased donation processing speed by 3x',
    ),
    ProjectPSI(
      problem:
          'Car rental company had no mobile booking or fleet tracking system',
      solution:
          'Developed a rental app with GPS fleet tracking and booking flow',
      impact: 'Grew online bookings by 80% and reduced idle fleet time by 20%',
    ),
    ProjectPSI(
      problem: 'Employees had no easy way to clock in/out remotely',
      solution: 'Built a geofenced attendance app with facial recognition',
      impact: 'Eliminated buddy punching and saved 15 hours of HR work weekly',
    ),
    ProjectPSI(
      problem:
          'Music teachers had no digital tool to assign and review practice',
      solution:
          'Created a music practice app with audio recording and feedback',
      impact:
          'Students practiced 40% more consistently with structured tracking',
    ),
    ProjectPSI(
      problem: 'Food truck owners had no way to broadcast their daily location',
      solution: 'Built a real-time food truck locator app with push alerts',
      impact: 'Increased average daily customers per truck by 35%',
    ),
    ProjectPSI(
      problem: 'Patients struggled to remember and log daily medication intake',
      solution:
          'Developed a medication tracker with reminders and history logs',
      impact: 'Improved patient medication adherence by 65% in clinical trials',
    ),
  ];

  static final projects = List.generate(
    28,
    (index) => ProjectModel(
      coverImage: PortfolioData.cardsImages[0],
      title: 'Project ${index + 1}',
      description: 'Description for project ${index + 1}',
      features: [
        'Feature 1',
        'Feature 2',
        'Feature 3',
        'Feature 4',
        'Feature 5'
      ],
      tech: [
        'Tech 1',
        'Tech 2',
        'Tech 3',
        'Tech 4',
        'Tech 5',
        'Tech 6',
        'Tech 7',
        'Tech 8',
        'Tech 9',
        'Tech 10',
        'Tech 11',
        'Tech 12',
        'Tech 13',
      ],
      images: PortfolioData.cardsImages,
      //
      problem: projectsPSI[index].problem,
      solution: projectsPSI[index].solution,
      impact: projectsPSI[index].impact,
    ),
  );
}

class ProjectModel {
  final String title;
  final String description;
  final String coverImage;
  final String? problem;
  final String? solution;
  final String? impact;
  final List<String> images;
  final List<String> features;
  final List<String> tech;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.coverImage,
    this.problem,
    this.solution,
    this.impact,
    required this.images,
    required this.features,
    required this.tech,
  });
}

class ProjectPSI {
  final String problem;
  final String solution;
  final String impact;

  const ProjectPSI({
    required this.problem,
    required this.solution,
    required this.impact,
  });
}
