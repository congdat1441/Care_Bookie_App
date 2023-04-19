class AppBanner {
  final int id;
  final String title;
  final String thumbnailUrl;

  AppBanner(this.id, this.title, this.thumbnailUrl);
}

// sample data
List<AppBanner> appBannerList = [
  AppBanner(1, 'Title', 'https://picsum.photos/id/1/400/300'),
  AppBanner(2, 'Title', 'https://picsum.photos/id/2/400/300'),
  AppBanner(3, 'Title', 'https://picsum.photos/id/3/400/300'),
  AppBanner(4, 'Title', 'https://picsum.photos/id/4/400/300'),
];
