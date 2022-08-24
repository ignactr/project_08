import 'dart:ffi';

import 'package:flutter/material.dart';

const registerInfo = SnackBar(
  content: Text('Rejestrowanie wkrótce'),
);

class CustomListItem extends StatelessWidget {
  String cut() {
    String description = eventDescription;
    if (description.length > 50) {
      return description.substring(0, 50) + ' ...';
    }
    return description;
  }

  const CustomListItem({
    Key? key,
    required this.eventName,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventDescription,
  }) : super(key: key);

  final String eventName;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final String eventDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(eventName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        Text('Rozpoczęcie: ${eventStartDate}', style: TextStyle(fontSize: 18)),
        Text('Zakończenie: ${eventEndDate}', style: TextStyle(fontSize: 18)),
        Text(cut()),
      ]),
      margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        border: Border.all(color: Colors.teal.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  //final DateFormat datePattern = DateFormat('yyyy-MM-dd hh:mm');
  final enterPage;
  MainPage(this.enterPage);

  final List<Map<String, String>> eventList = [
    {
      'Title': 'Lorem Ipsum',
      'StartDate': '2022-09-20',
      'EndDate': '2022-09-23',
      'Description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
      'Image': 'images/grafika.png'
    },
    {
      'Title': 'Kobiety Wschodu FUTURE IS NOW',
      'StartDate': '2022-08-28',
      'EndDate': '2022-08-29',
      'Description':
          'w przestrzeni Opery i Filharmonii Podlaskiej odbędzie się wyjątkowe wydarzenie - widowisko muzyczne - koncert pieśni ukraińskich w elektronicznych aranżacjach Miss God z użyciem harfy laserowej - w efekcie powstaje gra światłem.',
      'Image': 'images/grafika.png'
    },
    {
      'Title': 'Konkurs - "Sposoby widzenia"',
      'StartDate': '2022-06-27',
      'EndDate': '2022-09-22',
      'Description':
          'Białostocki Ośrodek Kultury ogłasza XII edycję Konkursu Fotograficznego Ogólnopolskiego Przeglądu Fotografii Współczesnej "Sposoby widzenia"!',
      'Image': 'images/grafika.png'
    },
    {
      'Title': 'Wystawa Magdaleny Talmon',
      'StartDate': '2022-07-07',
      'EndDate': '2022-08-31',
      'Description':
          '"Kobiety" – ten cykl obrazów zaprezentuje w Domu Kultury „Śródmieście” w Białymstoku Magdalena Talmon. Wernisaż wystawy malarstwa odbędzie się w czwartek (7.07).',
      'Image': 'images/wigilia.png'
    },
    {
      'Title': 'Wigilia Charytatywna',
      'StartDate': '2022-12-24 15:30',
      'EndDate': '2022-12-24 20:00',
      'Description':
          'Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!',
      'Image': 'images/wigilia.png'
    },
    {
      'Title': 'Spektakl "Hetmański bal"',
      'StartDate': '2022-08-28',
      'EndDate': '2022-08-31',
      'Description':
          'Hetmański Bal to spektakl, w którym grupa Spider Demon Massacre pragnie wyprawić urodziny jednemu z najbardziej zasłużonych mieszkańców Białegostoku – Janowi Klemensowi Branickiemu. Przy stole zasiądą najdostojniejsi goście oraz przyjaciele, a całą uroczystość poprowadzi nadworny aktor, gawędziarz. W tym spotkaniu przyjrzymy się historii naszego miasta z różnych stron. Nie boimy się zajrzeć w jasne i ciemne zakamarki naszego kulturowego dziedzictwa. W każdym elemencie historii tkwi potencjał, który odpowiednio wykorzystany może uczyć i doprowadzić do czegoś ważnego.',
      'Image': 'images/wigilia.png'
    },
    {
      'Title': 'Joga w Parku w Białymstoku',
      'StartDate': '2022-06-29',
      'EndDate': '2022-12-24 20:00',
      'Description':
          'Fundacja Art of Living Polska wraz ze studiem Joga Ruch Oddech zapraszają mieszkańców Białegostoku i okolic na otwarte sesje jogi w parku od 29 czerwca do 31 sierpnia, w każdą środę w godz. 18.00- 19.00.',
      'Image': 'images/wigilia.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      itemCount: eventList.length,
      itemBuilder: (context, index) {
        final item = eventList[index];

        return CustomListItem(
          eventName: eventList[index]['Title'].toString(),
          eventStartDate:
              DateTime.parse(eventList[index]['StartDate'].toString()),
          eventEndDate: DateTime.parse(eventList[index]['EndDate'].toString()),
          eventDescription: eventList[index]['Description'].toString(),
        );
      },
    );
  }
}
