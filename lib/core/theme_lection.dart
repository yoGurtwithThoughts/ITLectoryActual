import 'dart:ui';

import 'package:flutter/cupertino.dart';

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
  'Что такое WPF?': [
    Lecture(
      title: 'Что такое WPF?',
      content: '''\tWPF (Windows Presentation Foundation) — это 
подсистема для создания графических интерфейсов в экосистеме .NET, 
основанная на DirectX. В отличие от WinForms, где отрисовка элементов 
управления осуществляется через User32 и GDI+, WPF использует графический процессор,
что позволяет задействовать аппаратное ускорение.
WPF использует язык разметки XAML, основанный на XML, для создания интерфейсов, 
что позволяет комбинировать декларативное 
объявление и код на C#, VB.NET или F#. Первая версия WPF 3.0 была выпущена
в 2006 году вместе с .NET Framework 3.0 и Windows Vista. С тех пор WPF продолжает 
развиваться и полностью поддерживается в последней версии .NET 8.''',
        imageUrl: 'asstes/imagetheme/lg.png'
    ),
    Lecture(
      title: 'Архитектура WPF',
      content: '''WPF (Windows Presentation Foundation) 
      делится на два уровня: управляемый API и неуправляемый API, 
      который интегрируется с DirectX.
      Управляемый API (Managed API) работает под управлением Common 
      1. Language Runtime (.NET CLR) и включает следующие компоненты:
      2. PresentationFramework.dll: содержит основные реализации компонентов 
      и элементов управления для построения графического интерфейса.
      3. PresentationCore.dll: включает базовые типы для большинства классов из 
      PresentationFramework.dll.
      5. WindowsBase.dll: содержит вспомогательные классы, используемые в WPF и за его пределами.
      Неуправляемый API (Unmanaged API) обеспечивает интеграцию с DirectX:
      milcore.dll: отвечает за взаимодействие компонентов WPF с DirectX и 
      написан на неуправляемом коде (C/C++).
      6. WindowsCodecs.dll: предоставляет низкоуровневую поддержку для работы с изображениями в WPF.
      Ниже этих уровней находятся компоненты операционной системы и DirectX, 
      которые выполняют визуализацию элементов приложения и другую низкоуровневую обработку. 
      В частности, визуализация осуществляется через интерфейс Direct3D, 
      входящий в состав DirectX.
      На этом же уровне располагается библиотека user32.dll. 
      Хотя WPF не использует её для рендеринга и визуализации, 
      она продолжает применяться для некоторых вычислительных задач, 
      не связанных с визуализацией.''',
      imageUrl: 'asstes/imagetheme/lg.png'
    ),
  ],
  'Язык разметки XAML': [
    Lecture(
      title: 'Основы XAML',
      content: 'XAML (Extensible Application Markup Language) — язык ...',
      imageUrl: 'asstes/imagetheme/lg.png'
    ),
    Lecture(
      title: 'Контейнеры компоновки',
      content: 'Контейнеры компоновки включают Grid, StackPanel и т.д ...',
        imageUrl: 'asstes/imagetheme/lg.png')

  ],
  // Добавьте другие категории и лекции по аналогии
};