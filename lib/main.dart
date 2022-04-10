import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var tovs=0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Товары"),
          backgroundColor: Colors.blueGrey
        ),
        body: Center(child: SwipeList()));
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  List items = getDummyList();
  List prices = getPrices();
  List fotos = getFotos();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(

          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(items[index]),
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              direction: DismissDirection.endToStart,
              child: Card(
                elevation: 5,
            child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              void showAlertDialog(BuildContext context) {

                Widget continueButton = TextButton(
                  child: Text("Да"),
                  onPressed:  () {tovs++;},
                );

                // set up the AlertDialog
                AlertDialog alert = AlertDialog(
                  title: Text("Корзина"),
                  content: Text("Вы хотите добавить товар в корзину? Если нет, тапните на свободное пространство."),
                  actions: [
                    continueButton,
                  ],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              }
              showAlertDialog(context);
            },
                child: Container(
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5)
                            ),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                NetworkImage(fotos[index])
                            )
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Женская обувь " + items[index],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                child: Container(
                                  width: 62,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.teal),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Text(prices[index],textAlign: TextAlign.center,),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                  width: 260,
                                  child: Text("Отличные ботинки", style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 48, 48, 54)
                                  ),),


                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),)
            );

          },
        ));
  }

  static List getDummyList() {
    List list = List.generate(5, (i) {
      return "${i + 1}";
    });
    list[0] = "Nike Air Max Viva";
    list[1] = "Nike Air Max Viva";
    list[2] = "Nike Air Max Viva";
    list[3] = "Nike Air Max Verona";
    list[4] = "Nike Air Max 90 Valentine's Day";
    return list;
  }

  static List getPrices() {
    List list = List.generate(5, (i) {
      return "${i + 1}";
    });
    list[0] = "10 999 Р";
    list[1] = "10 999 Р";
    list[2] = "10 990 Р";
    list[3] = "10 790 Р";
    list[4] = "12 490 Р";
    return list;
  }

  static List getFotos() {
    List list = List.generate(5, (i) {
      return "${i + 1}";
    });
    list[0] = "https://sun1-22.userapi.com/impg/JhGNYKafkJBkhdnbNMHfXHBSvkVL1WYsviiqfg/gonn7yqXoKI.jpg?size=179x0&crop=0.012,0.106,0.98,0.784&quality=95&sign=3207a7e610d92c356b477d05caf2f281";
    list[1] = "https://sun1-28.userapi.com/impg/SxWjOZDIHIDT0Wy-hEPTSb0k4bY9q7XVAd90FQ/p2_4qyJdAUk.jpg?size=179x0&crop=0.012,0.106,0.98,0.784&quality=95&sign=df4d031fc626ae4cdb17927276f555db";
    list[2] = "https://sun1-55.userapi.com/impg/motsevi-yPe1-zIMvH_IgCtPAIvg78lgd8K1WA/9AmVYsX4L-Q.jpg?size=179x0&crop=0.012,0.106,0.98,0.784&quality=95&sign=1cfe27bcc153a1bf0c632b406685c49d";
    list[3] = "https://sun1-15.userapi.com/impg/E26ibu4Lk9qG_Qm7eLor2Kn4dGGlHfcmAq7K6A/WkXiLismxv8.jpg?size=179x0&crop=0.012,0.106,0.98,0.784&quality=95&sign=8aa7c2e6465b9568b2b98e74cd7d618c";
    list[4] = "https://sun1-14.userapi.com/impg/c857224/v857224472/dc97a/cHDXIaBKxrU.jpg?size=179x0&crop=0.012,0.106,0.98,0.784&quality=95&sign=ff95f5d47ddf75ad2885c298c021fb8b";
    return list;
  }
}
