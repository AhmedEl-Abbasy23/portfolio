import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/exports.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  ProjectModel & ProjectPSI
// ─────────────────────────────────────────────────────────────────────────────

class ProjectModel {
  final String id;
  final String title;
  final String type;
  final String description;
  final String? coverImage;
  final String problem;
  final String solution;
  final String impact;
  final List<String> images;
  final List<String> features;
  final List<String> tech;
  final String? previewUrl;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    this.coverImage, // TODO: will be required later.
    required this.problem,
    required this.solution,
    required this.impact,
    required this.images,
    required this.features,
    required this.tech,
    this.previewUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id:          json['id'] as String,
      title:       json['title'] as String,
      type:        json['type'] as String? ?? '',
      description: json['description'] as String? ?? '',
      coverImage:  json['cover_image'] as String?,
      // coverImage:  json['cover_image'] as String? ?? '', // TODO. uncomment later
      problem:     json['problem'] as String? ?? '',
      solution:    json['solution'] as String? ?? '',
      impact:      json['impact'] as String? ?? '',
      images:      List<String>.from(json['images'] as List? ?? []),
      features:    List<String>.from(json['features'] as List? ?? []),
      tech:        List<String>.from(json['tech'] as List? ?? []),
      previewUrl:  json['preview_url'] as String?,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  PortfolioData
// ─────────────────────────────────────────────────────────────────────────────

class PortfolioData {
  PortfolioData._();

  // ── Static non-project data (unchanged) ────────────────────────────────────

  static const List<String> skills = [
    'Flutter', 'Dart', 'BLoC', 'Firebase',
    'REST APIs', 'Chat', 'Maps', 'Performance', 'Clean Architecture',
  ];

  static const List<String> features = [
    'Voice & Video Calls', 'Real-time Chat', 'Push Notifications',
    'Maps & Tracking', 'Dashboards', 'Scalable Architecture',
  ];

  static const List<String> achievements = [
    'Delivered 20+ mobile apps across industries.',
    'Built 3 responsive websites.',
    'Created scalable, maintainable software.',
    'Integrated chat & call features.',
    'Collaborated with teams to ship products.',
    'Improved app performance for smooth UX.',
  ];

  static List<SvgGenImage> get achievementsIcons => [
    Assets.icons.achievement1, Assets.icons.achievement2,
    Assets.icons.achievement3, Assets.icons.achievement4,
    Assets.icons.achievement5, Assets.icons.achievement6,
    Assets.icons.achievement7, Assets.icons.achievement8,
  ];

  static const List<String> platforms = ['LinkedIn', 'GitHub', 'Email', 'WhatsApp'];

  static final List<IconData> icons = [
    FontAwesomeIcons.linkedin,
    FontAwesomeIcons.github,
    FontAwesomeIcons.envelope,
    FontAwesomeIcons.whatsapp,
  ];

  static final List<AssetGenImage> imagesLocal = [
    Assets.images.cover1, Assets.images.cover2, Assets.images.cover3,
    Assets.images.cover4, Assets.images.cover5, Assets.images.cover6,
  ];

  // ── Projects — loaded from JSON ────────────────────────────────────────────

  // Private cache — populated once by loadProjects()
  static List<ProjectModel> _projects = [];

  /// Call this once in main() or your DI setup before using [projects].
  ///
  /// ```dart
  /// await PortfolioData.loadProjects();
  /// ```
  static Future<void> loadProjects() async {
    if (_projects.isNotEmpty) return; // already loaded

    final raw = await rootBundle.loadString('assets/data/projects.json');
    final Map<String, dynamic> decoded = json.decode(raw) as Map<String, dynamic>;
    final List<dynamic> list = decoded['projects'] as List<dynamic>;

    _projects = list
        .map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// All projects. Make sure [loadProjects()] has completed first.
  static List<ProjectModel> get projects => _projects;
}