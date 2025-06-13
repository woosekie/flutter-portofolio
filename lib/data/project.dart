class ProjectItem {
  final String title;
  final String description;
  final String imagePath;
  final bool isAssetImage;
  final String? githubUrl;
  final String? dribbbleUrl;
  final String? playstoreUrl;

  ProjectItem(
      {required this.title,
      required this.description,
      required this.imagePath,
      this.isAssetImage = true,
      this.githubUrl,
      this.dribbbleUrl,
      this.playstoreUrl});
}
