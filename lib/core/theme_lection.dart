class Lecture {
  final String title;
  final String content;
  final String imageUrl;
  Lecture({
    required this.title,
    required this.content,
    required this.imageUrl
  });
}
// Темы и лекции
final Map<String, List<Lecture>> lecturesData = {
  'История и развитие WPF': [
    Lecture(
      title: 'История и развитие WPF',
      content: '''\tWPF (Windows Presentation Foundation) — это ...''',
      imageUrl: 'assets/imagetheme/lg.png',
    ),
  ],
  'Архитектура WPF': [
    Lecture(
      title: 'Архитектура WPF',
      content: '''\tWPF (Windows Presentation Foundation) — это ...''',
      imageUrl: 'assets/imagetheme/lg.png',
    ),
  ],
  'Создание простого WPF-приложения (Hello World)': [
    Lecture(
      title: 'Создание простого WPF-приложения (Hello World)',
      content: 'XAML (Extensible Application Markup Language) — язык ...',
      imageUrl: 'assets/imagetheme/lg.png',
    ),
  ],
};

final Map<String, List<Lecture>> lecturesData1 = {
  'Основные понятия': [
    Lecture(
      title: 'Основные понятия',
      content: 'XAML (Extensible Application Markup Language) — язык ...',
      imageUrl: 'assets/imagetheme/lg.png',
    ),
  ],
  'Элементы': [
    Lecture(
      title: 'Элементы',
      content: 'XAML (Extensible Application Markup Language) — язык ...',
      imageUrl: 'assets/imagetheme/lg.png',
    ),
  ],
  'Основные понятия контейнеров': [
    Lecture(
      title: 'Основные понятия контейнеров',
      content: 'XAML (Extensible Application Markup Language) — язык ...',
      imageUrl: 'assets/imagetheme/lg.png',
    ),
  ],
};