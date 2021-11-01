import 'package:flutter/material.dart';
import 'package:flutter_application_2/resources/app_images.dart';
import 'package:flutter_application_2/ui/navigation/main_navigation.dart';

class Movie {
  final int id; // Хранение даных
  final String imageNeme;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id, // конструктор  required обязательный
    required this.imageNeme,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    // спасиок
    Movie(
      id: 1,
      // первый класс
      imageNeme: AppImages.luca,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 2,
      imageNeme: AppImages.pawPatrol,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 3,
      imageNeme: AppImages.spaceJam,
      title: 'Space Jam',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 4,
      imageNeme: AppImages.theBossBaby2,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 5,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 6,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 7,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 8,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 9,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 10,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 11,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 12,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 13,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 14,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 15,
      imageNeme: AppImages.moviePlacholder,
      title: 'Смертельная битва',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
    Movie(
      id: 16,
      imageNeme: AppImages.moviePlacholder,
      title: 'Человек паук',
      time: 'April 7, 2021',
      description:
          'If the [style] argument is null, the text will use the style from the closest enclosing',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchConrroller = TextEditingController(); // отслеживать вод текста

  void _serchMovies() {
    final query = _searchConrroller.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query
            .toLowerCase()); //toLowerCase ищет текст по маленкой букве и по большой
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    //ini  Вызывается тоьлко один раз
    super.initState();
    _filteredMovies = _movies; // Без этой строки не показывает список
    _searchConrroller.addListener(_serchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNams.movieDetails,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    // в Build должна быть только верстка
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70), // Отступ с низу поиска
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
              .onDrag, // Прячит текстовое поле клавиотуру
          itemCount: _filteredMovies.length, // сколько фильмов в списке
          itemExtent: 163, // высота ячеяк
          itemBuilder: (BuildContext context, int index) {
            final movie =
                _filteredMovies[index]; // фильм отоброжается под index
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
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
                    clipBehavior: Clip.hardEdge, // Закругляет края

                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageNeme)),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                movie.title,

                                style: const TextStyle(
                                    fontWeight:
                                        FontWeight.bold), // жмрный шрифт
                                maxLines: 1, // обризает текст
                                overflow:
                                    TextOverflow.ellipsis, // обризает текст
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie.time,
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 1, // обризает текст
                                overflow:
                                    TextOverflow.ellipsis, // обризает текст
                              ),
                              const SizedBox(height: 20),
                              Text(
                                movie.description,
                                maxLines: 2, // обризает текст
                                overflow:
                                    TextOverflow.ellipsis, // обризает текст
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      // эфект нажатия
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _onMovieTap(
                          index), // index номер текушей строчки в с писке
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            // поиск
            controller: _searchConrroller, //  отслеживать вод текста
            decoration: InputDecoration(
              labelText: 'Поиск', // текст
              filled: true, // это чтобы цвет за дать
              fillColor:
                  Colors.white.withAlpha(235), // прозрачность withAlpha(235)
              border: const OutlineInputBorder(), // рамка
            ),
          ),
        ),
      ],
    );
  }
}
