import 'package:flutter/material.dart';
import 'package:laprea/feature/home/widget/appointment_item_widget.dart';
import 'package:laprea/feature/home/widget/favor_chip_widget.dart';
import 'package:laprea/feature/home/widget/favor_widget.dart';
import 'package:laprea/feature/home/widget/news_card_widget.dart';
import 'package:laprea/feature/home/widget/specialist_card_widget.dart';
import 'package:laprea/ui_kit/theme/app_style.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class ActionModel {
  final String imageUrl;
  final String title;
  final String desc;

  ActionModel({required this.imageUrl, required this.desc, required this.title});
}

class AppointmentModel {
  final String title;
  final String desc;
  final String imageUrl;
  final String time;
  final String price;
  final String status;

  AppointmentModel({
    required this.imageUrl,
    required this.desc,
    required this.title,
    required this.time,
    required this.price,
    required this.status,
  });
}

class FavorModel {
  final String imageUrl;
  final String title;

  FavorModel({required this.imageUrl, required this.title});
}

class SpecialistModel {
  final String imageUrl;
  final String name;
  final String major;

  SpecialistModel({required this.imageUrl, required this.name, required this.major});
}

class NewsModel {
  final String imageUrl;
  final String title;
  final String desc;
  final String time;

  NewsModel({required this.imageUrl, required this.title, required this.desc, required this.time});
}

class HomeMainWidget extends StatefulWidget {
  const HomeMainWidget({super.key});

  @override
  State<HomeMainWidget> createState() => _HomeMainWidgetState();
}

class _HomeMainWidgetState extends State<HomeMainWidget> {
  final _actions = <ActionModel>[
    ActionModel(title: 'ВИСЦЕРАЛЬНЫЙ МАССАЖ В LAPREA', desc: '-8 см за один сеанс', imageUrl: UiAssets.action1),
    ActionModel(title: 'ВИСЦЕРАЛЬНЫЙ МАССАЖ В LAPREA', desc: '-8 см за один сеанс', imageUrl: UiAssets.action1),
  ];

  final _appointments = <AppointmentModel>[
    AppointmentModel(
      title: 'Суббота, 31 мая',
      desc: 'Расслабляющий массаж',
      imageUrl: UiAssets.appointment1,
      time: '12:30-13:30',
      price: '2 500 ₽',
      status: 'Вы записаны',
    ),
    AppointmentModel(
      title: 'Суббота, 31 мая',
      desc: 'Расслабляющий массаж',
      imageUrl: UiAssets.appointment1,
      time: '12:30-13:30',
      price: '2 500 ₽',
      status: 'Вы записаны',
    ),
  ];

  final _favorChips = <String>['Чистка лица', 'Лазерная эиляция', 'Гидромассаж'];

  final _favors = <FavorModel>[
    FavorModel(imageUrl: UiAssets.favor1, title: 'Спа aroma-oil'),
    FavorModel(imageUrl: UiAssets.favor2, title: 'Тайский массаж'),
    FavorModel(imageUrl: UiAssets.favor3, title: 'Омолаживающая'),
  ];

  final _specialists = <SpecialistModel>[
    SpecialistModel(imageUrl: UiAssets.specialist1, name: 'Журавлева В.Н.', major: 'Массажист'),
    SpecialistModel(imageUrl: UiAssets.specialist1, name: 'Журавлева В.Н.', major: 'Массажист'),
    SpecialistModel(imageUrl: UiAssets.specialist1, name: 'Журавлева В.Н.', major: 'Массажист'),
    SpecialistModel(imageUrl: UiAssets.specialist1, name: 'Журавлева В.Н.', major: 'Массажист'),
  ];

  final _news = <NewsModel>[
    NewsModel(
      imageUrl: UiAssets.news1,
      title: 'Гармоны и красота',
      desc: 'Вы когда-нибудь задумывались, почему даже самый дорогой крем не всегда',
      time: 'Сегодня • 23 мин. назад',),
    NewsModel(
      imageUrl: UiAssets.news2,
      title: 'Что подарить на 8 марта?',
      desc: 'Выбор подарка - ответственная задача. Хочется, чтобы он был не только',
      time: 'Вчера • 16:34',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 56, width: double.infinity, child: Center(child: UiIcon(UiAssets.logo))),
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Image.asset(_actions[index].imageUrl, fit: BoxFit.contain);
                  },
                  separatorBuilder: (_, __) => Gap(8),
                  itemCount: _actions.length,
                  padding: EdgeInsets.fromLTRB(16, 8, 36, 8),
                ),
              ),
              Gap(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Мои посещения', style: context.text2xlMedium()),
                    SizedBox(width: 48, height: 48, child: Center(child: UiIcon(UiAssets.arrowRight24))),
                  ],
                ),
              ),
              SizedBox(
                height: 182,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return AppointmentItemWidget(model: _appointments[index]);
                  },
                  separatorBuilder: (_, __) => Gap(8),
                  itemCount: _appointments.length,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
              Gap(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Услуги', style: context.text2xlMedium()),
                    SizedBox(width: 48, height: 48, child: Center(child: UiIcon(UiAssets.arrowRight24))),
                  ],
                ),
              ),
              SizedBox(
                height: 64,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return FavorChipWidget(label: _favorChips[index]);
                  },
                  separatorBuilder: (_, __) => Gap(8),
                  itemCount: _favorChips.length,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
              SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return FavorWidget(model: _favors[index]);
                  },
                  separatorBuilder: (_, __) => Gap(8),
                  itemCount: _favors.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              Gap(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Специалисты', style: context.text2xlMedium()),
                    SizedBox(width: 48, height: 48, child: Center(child: UiIcon(UiAssets.arrowRight24))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Наши мастера в Laprea бережно преобразят ваше тело, даря минуты расслабления и уверенности.',
                  style: context.textSmMedium(),
                ),
              ),
              Gap(16),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return SpecialistCardWidget(model: _specialists[index]);
                  },
                  separatorBuilder: (_, __) => Gap(8),
                  itemCount: _specialists.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              Gap(32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Новости', style: context.text2xlMedium()),
                    SizedBox(width: 48, height: 48, child: Center(child: UiIcon(UiAssets.arrowRight24))),
                  ],
                ),
              ),
              Gap(16),
              Column(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: _news.map((el) => NewsCardWidget(model: el)).toList(),
              ),
              Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
