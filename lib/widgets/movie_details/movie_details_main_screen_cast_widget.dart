import 'package:flutter/material.dart';
import 'package:flutter_application_2/resources/app_images.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0), // со всех сторон
            child: Text(
              'Series Cast',
              style: TextStyle(
                fontSize: 17, // размер текста
                fontWeight: FontWeight.w700, // жырность текста
              ),
            ),
          ),
          SizedBox(
            height: 300, // Высота
            child: Scrollbar(
              // Скрол бар нижняя полоска в низу бегает туда сюда
              child: ListView.builder(
                // builder - когда много элиментов
                itemCount: 20,
                itemExtent: 120, // ширена
                scrollDirection: Axis.horizontal, // скролица горизонталь
                itemBuilder: (BuildContext conteext, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0), // со всех сторон
                    child: DecoratedBox(
                      // Рамка вокрух колонки
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            Image(
                                image: AssetImage(
                                    AppImages.gabrielIglesias)), // фото актера
                            Padding(
                              padding: EdgeInsets.all(8.0), // со всех старон
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Steven Yeun',
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Mark Grayson / Invincible (voice)',
                                    maxLines: 4,
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    '8 Episodes',
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child:
                TextButton(onPressed: () {}, child: Text('Full Cast & Crew')),
          ),
        ],
      ),
    );
  }
}
