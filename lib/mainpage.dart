import 'dart:ffi';
import 'package:flutter/material.dart';
import 'showdetails.dart';

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
    required this.eventAuthor,
    required this.eventName,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventDescription,
    required this.handleDetails,
  }) : super(key: key);

  final String eventAuthor;
  final String eventName;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final String eventDescription;
  final handleDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          handleDetails(eventAuthor, eventName, eventStartDate, eventEndDate,
              eventDescription);
        },
        child: Container(
          child: Column(children: [
            Text(eventName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text('Rozpoczęcie: ${eventStartDate}',
                style: TextStyle(fontSize: 18)),
            Text('Zakończenie: ${eventEndDate}',
                style: TextStyle(fontSize: 18)),
            Text(cut()),
          ]),
          margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.teal[100],
            border: Border.all(color: Colors.teal.shade100),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class MainPage extends StatefulWidget {
  final enterPage;
  String? loggedLogin;
  MainPage(this.enterPage, this.loggedLogin);
  @override
  State<StatefulWidget> createState(){
    return _MainPageState(enterPage, loggedLogin);
  }
}
class _MainPageState extends State<MainPage> {
  
  final enterPage;
  String? loggedLogin;

  _MainPageState(this.enterPage, this.loggedLogin);

  String? authorToShow; 
  String? nameToShow; 
  DateTime? startDateToShow;  
  DateTime? endDateToShow; 
  String? descriptionToShow; 

  void handleDelete(eventName){
    for(var i = 0; i < eventList.length; i++){
      if(eventList[i]['Title'] == eventName){
        eventList.removeAt(i);
        handleGoBack();
      }
    }
  }

  void handleDetails(author, name, startDate, endDate, description){
    setState(() {
      authorToShow = author;
      nameToShow = name;
      startDateToShow = startDate;
      endDateToShow = endDate;
      descriptionToShow = description;
    });
  }
  void handleGoBack(){
    setState(() {
      authorToShow = null;
      nameToShow = null;
      startDateToShow = null;
      endDateToShow = null;
      descriptionToShow = null;
    });
  }
  List<Map> eventList = [
    {
      'Author': 'ignactr',
      'Title': 'Lorem Ipsum',
      'StartDate': '2022-09-20',
      'EndDate': '2022-09-23',
      'Description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
      'Image': 'images/grafika.png'
    },
    {
      'Author': 'FekalnyYeti',
      'Title': 'Kobiety Wschodu FUTURE IS NOW',
      'StartDate': '2022-08-28',
      'EndDate': '2022-08-29',
      'Description':
          'w przestrzeni Opery i Filharmonii Podlaskiej odbędzie się wyjątkowe wydarzenie - widowisko muzyczne - koncert pieśni ukraińskich w elektronicznych aranżacjach Miss God z użyciem harfy laserowej - w efekcie powstaje gra światłem.',
      'Image': 'images/grafika.png'
    },
    {
      'Author': 'Arczin',
      'Title': 'Konkurs - "Sposoby widzenia"',
      'StartDate': '2022-06-27',
      'EndDate': '2022-09-22',
      'Description':
          'Białostocki Ośrodek Kultury ogłasza XII edycję Konkursu Fotograficznego Ogólnopolskiego Przeglądu Fotografii Współczesnej "Sposoby widzenia"!',
      'Image': 'images/grafika.png'
    },
    {
      'Author': 'ignactr',
      'Title': 'Wystawa Magdaleny Talmon',
      'StartDate': '2022-07-07',
      'EndDate': '2022-08-31',
      'Description':
          '"Kobiety" – ten cykl obrazów zaprezentuje w Domu Kultury „Śródmieście” w Białymstoku Magdalena Talmon. Wernisaż wystawy malarstwa odbędzie się w czwartek (7.07).',
      'Image': 'images/wigilia.png'
    },
    {
      'Author': 'Arczin',
      'Title': 'Wigilia Charytatywna',
      'StartDate': '2022-12-24 15:30',
      'EndDate': '2022-12-24 20:00',
      'Description':
          'Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!',
      'Image': 'images/wigilia.png'
    },
    {
      'Author': 'Arczin',
      'Title': 'Spektakl "Hetmański bal"',
      'StartDate': '2022-08-28',
      'EndDate': '2022-08-31',
      'Description':
          'Hetmański Bal to spektakl, w którym grupa Spider Demon Massacre pragnie wyprawić urodziny jednemu z najbardziej zasłużonych mieszkańców Białegostoku – Janowi Klemensowi Branickiemu. Przy stole zasiądą najdostojniejsi goście oraz przyjaciele, a całą uroczystość poprowadzi nadworny aktor, gawędziarz. W tym spotkaniu przyjrzymy się historii naszego miasta z różnych stron. Nie boimy się zajrzeć w jasne i ciemne zakamarki naszego kulturowego dziedzictwa.',
      'Image': 'images/wigilia.png'
    },
    {
      'Author': 'ignactr',
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
    eventList.sort((m1, m2) {
      var r = m1["StartDate"].compareTo(m2["StartDate"]);
      if (r != 0) return r;
      return m1["EndDate"].compareTo(m2["StartDate"]);
    });
    return authorToShow != null ? ShowDetails(authorToShow, nameToShow, startDateToShow, endDateToShow, descriptionToShow, handleGoBack, loggedLogin, handleDelete) : ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      itemCount: eventList.length,
      itemBuilder: (context, index) {
        final item = eventList[index];

        return CustomListItem(
          eventAuthor: eventList[index]['Author'],
          eventName: eventList[index]['Title'].toString(),
          eventStartDate: DateTime.parse(eventList[index]['StartDate']),
          eventEndDate: DateTime.parse(eventList[index]['EndDate']),
          eventDescription: eventList[index]['Description'],
          handleDetails: handleDetails,
        );
      },
    );
  }
}
