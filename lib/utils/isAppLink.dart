bool isAppLink(String url) {
  final uri = Uri.parse(url);
  final appLink = uri.host.contains('whatsapp') ||
      uri.host.contains('facebook') ||
      uri.host.contains('youtube') ||
      uri.host.contains('instagram') ||
      uri.host.contains('tiktok') ||
      uri.host.contains('pinterest') ||
      uri.host.contains('signal') ||
      uri.host.contains('telegram');

  return appLink;
}
