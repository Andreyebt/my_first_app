import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Прибираємо синю стрічку дебагу
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Створимо змінну для зберігання кольору фону
  Color _backgroundColor = Colors.white;

  // Функція для зміни фону
  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color; // Оновлюємо стан і змінюємо колір фону
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask a Question'),
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), // Іконка гамбургера
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Відкриває Drawer
              },
            );
          },
        ),
        actions: [
          // Іконка долара для переходу на сторінку оплати
          IconButton(
            icon: Icon(Icons.payment),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentPage()), // Перехід на сторінку оплати
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Меню'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Змінити на червоний'),
              onTap: () {
                _changeBackgroundColor(Colors.red); // Зміна на червоний
                Navigator.pop(context); // Закриває меню
              },
            ),
            ListTile(
              title: Text('Змінити на синій'),
              onTap: () {
                _changeBackgroundColor(Colors.blue); // Зміна на синій
                Navigator.pop(context); // Закриває меню
              },
            ),
            ListTile(
              title: Text('Змінити на жовтий'),
              onTap: () {
                _changeBackgroundColor(Colors.yellow); // Зміна на жовтий
                Navigator.pop(context); // Закриває меню
              },
            ),
            ListTile(
              title: Text('Змінити на чорний'),
              onTap: () {
                _changeBackgroundColor(Colors.black); // Зміна на чорний
                Navigator.pop(context); // Закриває меню
              },
            ),
            ListTile(
              title: Text('Змінити на зелений'),
              onTap: () {
                _changeBackgroundColor(Colors.green); // Зміна на зелений
                Navigator.pop(context); // Закриває меню
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: _backgroundColor, // Колір фону залежить від змінної
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Відступи
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Центрування по вертикалі
              crossAxisAlignment: CrossAxisAlignment.center, // Центрування по горизонталі
              children: [
                // Текстове питання
                Text(
                  'Lawyer Ai',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20), // Відступ між питанням та полем для вводу

                // Поле для вводу
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Впишіть проблему',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                ),
                SizedBox(height: 20), // Відступ між полем вводу та кнопкою

                // Кнопка
                ElevatedButton(
                  onPressed: () {
                    print('Питання надіслано'); // Можна замінити це на дію, наприклад, відправити запит
                  },
                  child: Text('Ask'), // Текст на кнопці
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 15)), // Розмір кнопки
                    backgroundColor: MaterialStateProperty.all(Colors.blue), // Колір кнопки
                    foregroundColor: MaterialStateProperty.all(Colors.white), // Колір тексту на кнопці
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Сторінка оплати',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Місце для логіки оплати
                  print('Оплата виконана');
                },
                child: Text('Зробити платіж'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
