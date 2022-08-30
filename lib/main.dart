import 'package:flutter/material.dart';
import 'registerform.dart';
import 'mainpage.dart';
import 'loginform.dart';
import 'neweventform.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int _pageNumber = 0;
  void enterPage(int pageNumber) {
    setState(() {
      _pageNumber = pageNumber;
    });
  }

  void handleLogin(String mailToLog) {
    String? loginToLog;
    for (var i = 0; i < users.length; i++) {
      if (users[i]['userMail'] == mailToLog) {
        loginToLog = users[i]['userLogin'];
      }
    }
    setState(() {
      loggedLogin = loginToLog;
    });
  }

  void handleRegister(String mail, String login, String password) {
    setState(() {
      users.add({'userMail': mail, 'userLogin': login, 'userPass': password});
      loggedLogin = login;
    });
  }

  void handleAddEvent(
    String author,
    String title,
    String startDate,
    String endDate,
    String description,
    String image,
  ) {
    setState(() {
      eventList.add({
        'Author': author,
        'Title': title,
        'StartDate': startDate,
        'EndDate': endDate,
        'Description': description,
        'Image': image,
      });
    });
  }

  var users = [
    {
      'userMail': 'ignacy.trocki@wp.pl',
      'userLogin': 'ignactr',
      'userPass': '01b307acba4f54f55aafc33bb06bbbf6ca803e9a'
    }, //pass: 1234567890
    {
      'userMail': 'sebastian.zubrycki@gmail.com',
      'userLogin': 'SebastianZ',
      'userPass': '8104ba1dc0409b259f487ed07db477c38f205a30'
    }, //pass: 0000000000
    {
      'userMail': 'dudini.garibaldi@gmail.com',
      'userLogin': 'Arczin',
      'userPass': 'c1602d2c7d8cd8a7450246e4d214ad6a1ecf5259'
    }, //pass: dudek1234
    {
      'userMail': 'naaajak.git@git.com',
      'userLogin': 'FekalnyYeti',
      'userPass': 'fd576197b0bc322593923292327784d832221e44'
    }, //pass: mlecznygolem
  ];

  List<Map> eventList = [
    {
      'Author': 'ignactr',
      'Title': 'Lorem Ipsum',
      'StartDate': '2022-09-20',
      'EndDate': '2022-09-23',
      'Description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
      'Image': 'https://kulturaodnowa.pl/wp-content/uploads/2021/03/Lorem-Ipsum-alternatives.png'
    },
    {
      'Author': 'FekalnyYeti',
      'Title': 'FUTURE IS NOW',
      'StartDate': '2022-08-28',
      'EndDate': '2022-08-29',
      'Description':
          'w przestrzeni Opery i Filharmonii Podlaskiej odbędzie się wyjątkowe wydarzenie - widowisko muzyczne - koncert pieśni ukraińskich w elektronicznych aranżacjach Miss God z użyciem harfy laserowej - w efekcie powstaje gra światłem.',
      'Image': 'https://muzeum1939.pl/sites/default/files/styles/870/public/galeria/2019/09/a53e0c8e776da69b9f3bfbb3ae559ad710991.jpg?itok=tMmfCbeb'
    },
    {
      'Author': 'Arczin',
      'Title': '"Sposoby widzenia"',
      'StartDate': '2022-06-27',
      'EndDate': '2022-09-22',
      'Description':
          'Białostocki Ośrodek Kultury ogłasza XII edycję Konkursu Fotograficznego Ogólnopolskiego Przeglądu Fotografii Współczesnej "Sposoby widzenia"!',
      'Image': 'https://ipn.gov.pl/dokumenty/zalaczniki/1/1-50033.jpg'
    },
    {
      'Author': 'ignactr',
      'Title': 'Wystawa Magdaleny T',
      'StartDate': '2022-07-07',
      'EndDate': '2022-08-31',
      'Description':
          '"Kobiety" – ten cykl obrazów zaprezentuje w Domu Kultury „Śródmieście” w Białymstoku Magdalena Talmon. Wernisaż wystawy malarstwa odbędzie się w czwartek (7.07).',
      'Image': 'https://bi.im-g.pl/im/7d/4b/16/z23377021K,Wystawa--Twoj-Vincent-van-Gogh--Obrazy-z-filmu--w-.jpg'
    },
    {
      'Author': 'Arczin',
      'Title': 'Wigilia Charytatywna',
      'StartDate': '2022-12-24 15:30',
      'EndDate': '2022-12-24 20:00',
      'Description':
          'Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!',
      'Image': 'https://pannellier.pl/20609-large_default/choinka-sztuczna-drzewko-swiateczne-stroik.jpg'
    },
    {
      'Author': 'Arczin',
      'Title': '"Hetmański bal"',
      'StartDate': '2022-08-28',
      'EndDate': '2022-08-31',
      'Description':
          'Hetmański Bal to spektakl, w którym grupa SDM pragnie wyprawić urodziny jednemu z najbardziej zasłużonych mieszkańców Białegostoku – Janowi Klemensowi Branickiemu. Przy stole zasiądą najdostojniejsi goście oraz przyjaciele, a całą uroczystość poprowadzi nadworny aktor, gawędziarz. W tym spotkaniu przyjrzymy się historii naszego miasta z różnych stron. Nie boimy się zajrzeć w jasne i ciemne zakamarki naszego kulturowego dziedzictwa.',
      'Image': 'https://dzieje.pl/sites/default/files/styles/open_article_750x0_/public/201704/czarniecki_stefan.jpg?itok=QG5MHgmO'
    },
    {
      'Author': 'ignactr',
      'Title': 'Joga w Parku',
      'StartDate': '2022-06-29',
      'EndDate': '2022-12-24 20:00',
      'Description':
          'Fundacja Art of Living Polska wraz ze studiem Joga Ruch Oddech zapraszają mieszkańców Białegostoku i okolic na otwarte sesje jogi w parku od 29 czerwca do 31 sierpnia, w każdą środę w godz. 18.00- 19.00.',
      'Image': 'https://gfx.stylzycia.radiozet.pl/var/radiozetstylzyci/storage/images/uroda/pielegnacja/hatha-joga-na-czym-polega-jakie-sa-jej-zalety-i-jak-zaczac-31313/9290118-1-pol-PL/Hatha-joga-na-czym-polega-jakie-sa-jej-zalety-i-jak-zaczac_size-360x270.jpg'
    },
  ];

  String? loggedLogin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.black,
                toolbarHeight: 55, //set your height
                flexibleSpace: SafeArea(
                  child: Container(
                      color: Colors.black,
                      child: _pageNumber == 1
                          ? Text('Zarejestruj się',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30))
                          : _pageNumber == 2
                              ? Text('Zaloguj się',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30))
                              : _pageNumber == 3
                                  ? Text('Szczegóły wydarzenia',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30))
                                  : _pageNumber == 4
                                      ? Text('Dodaj wydarzenie',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30))
                                      : loggedLogin == null
                                          ? Row(
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      enterPage(2);
                                                    },
                                                    child: Text('Zaloguj'),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.grey)),
                                                SizedBox(width: 10),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      enterPage(1);
                                                    },
                                                    child: Text('Rejestruj'),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.grey)),
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                Text('$loggedLogin',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20)),
                                                SizedBox(width: 10),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        loggedLogin = null;
                                                      });
                                                    },
                                                    child: Text('Wyloguj',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.grey)),
                                                SizedBox(width: 10),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      enterPage(4);
                                                    },
                                                    child: Text(
                                                        'Dodaj Wydarzenie',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.grey)),
                                              ],
                                            )),
                )),
            body: (_pageNumber == 0 || _pageNumber == 3)
                ? MainPage(enterPage, loggedLogin, eventList)
                : _pageNumber == 1
                    ? RegisterForm(enterPage, handleRegister, users)
                    : _pageNumber == 2
                        ? LoginForm(enterPage, handleLogin, users)
                        : NewEventForm(enterPage, handleAddEvent, eventList, loggedLogin)));

  }
}
