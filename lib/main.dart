import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycling App',
      theme: ThemeData(
        primaryColor: Color(0xFF4E7A27), // اللون المخصص
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => FirstPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            'https://media.istockphoto.com/id/157603061/photo/recycle-sign-made-of-green-trees.jpg?s=612x612&w=0&k=20&c=EOfFrmZ8fh53TEdFq-ogBLra0BfPJSb3TWIAhzKXMvc='),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Widget nextPage;

  const MyPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // الصورة في الجزء العلوي
          Image.network(
            image,
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.cover,
          ),
          // النص في الجزء السفلي
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(subtitle),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => nextPage),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4E7A27),
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: Text('NEXT'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyPage(
      image:'https://media.istockphoto.com/id/1672408138/vector/forest-in-geometric-abstract-shapes.jpg?s=612x612&w=0&k=20&c=50d4_7GarwF5UmRp8irBB_nBMAhFXSq9PtjTOFHU9t8=',
      title: 'Save Environment',
      subtitle: 'Protect the environment with the push of a button',
      nextPage: SecondPage(),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyPage(
      image:
          'https://media.istockphoto.com/id/1363045702/vector/collect-money-at-the-trees-in-the-forest-profit-and-return-concept-vector.jpg?s=612x612&w=0&k=20&c=GXcbqbY9AjGwC8Lm4sGjzo7rasz2ya3Qt3V1xH_nPs8=',
      title: 'Get Money',
      subtitle: 'You can get money from your waste',
      nextPage: ThirdPage(),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyPage(
      image:
          'https://media.istockphoto.com/id/1366700152/vector/hands-holding-earth-plant.jpg?s=612x612&w=0&k=20&c=PgGqDiO8I_jfrrDsnS2OXgs5cZac8J26BX4GGMlSg1I=',
      title: "Let's Start",
      subtitle: 'Start with us and give the environment a great chance!',
      nextPage: LoginPage(), // الانتقال إلى صفحة تسجيل الدخول والدخول
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=', // ضع رابط الصورة هنا
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.2), // يمكنك تعديل الشفافية هنا
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DataEntryPage(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF4E7A27), // Text color
                  ),
                  child: Text('sign up'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DataEntryPage(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF4E7A27), //Text color
                  ),
                  child: Text('log in'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

          

class DataEntryPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello !'),
      flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
            
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'name',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'phone number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage(name: nameController.text),
                ));
              },
              child: Text('log in'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String name;
  final int coins;

  CustomAppBar({required this.title, required this.name, required this.coins});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(),
      ),
      flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
            
          ],
        ),
     
      
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16), 
            
                     ),
          Container(
            padding: EdgeInsets.all(5), // تصغير حجم الصندوق
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.monetization_on,
                  color: Colors.yellow,
                  size: 16, // تصغير حجم الأيقونة
                ),
                SizedBox(width: 5),
                Text(
                  'coins: $coins',
                  style: TextStyle(fontSize: 14), // تصغير حجم النص
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.recycling),
          label: 'Recycle',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: onTap,
    );
  }
}
class HomePage extends StatefulWidget {
  final String name;
  final int coins = 500;

  HomePage({required this.name});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    RecycleContent(),
    SettingsContent(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Hello, ${widget.name}', name: widget.name, coins: widget.coins),
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}


class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10), // زيادة المسافة العلوية
            Text(
              ' Save environment',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // زيادة المسافة بين النصوص
            Text(
              ' our beautiful environment!',
              style: TextStyle(fontSize: 18),
            ),
                        SizedBox(height: 20), 
            Text(
              ' Our fields',
               style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildIcon(Icons.local_florist, 'plant'),
                    SizedBox(width: 16), // زيادة المسافة بين الأيقونات
                    _buildIcon(Icons.recycling, 'recycle'),
                    SizedBox(width: 16), // زيادة المسافة بين الأيقونات
                    _buildIcon(Icons.volunteer_activism, 'volunteer'),
                    SizedBox(width: 16), // زيادة المسافة بين الأيقونات
                    _buildIcon(Icons.pets, 'pets'),
                    SizedBox(width: 16), // زيادة المسافة بين الأيقونات
                    _buildIcon(Icons.nature, 'tree'),
                    SizedBox(width: 16), // زيادة المسافة بين الأيقونات
                    _buildIcon(Icons.flag, 'kuwait'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // زيادة المسافة بين النصوص
            Text(
              ' Discover',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), // زيادة المسافة بين النصوص
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImagesPage()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://media.istockphoto.com/id/1357100289/photo/green-threads-wave.jpg?s=612x612&w=0&k=20&c=ZKxezd611PuPHjmyLtwiRZxgi3feRgw0byb-lfDeOJ8='),
                    fit: BoxFit.cover,
                    
                  ),
                     borderRadius: BorderRadius.circular(12), 
                ),
                child: Center(
                  child: Text(
                    'View',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, String label) {
    return Container(
      width: 80, // عرض الحاوية
      height: 80, // ارتفاع الحاوية
      margin: EdgeInsets.symmetric(horizontal: 16), // زيادة المسافة الأفقية
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 40),
          SizedBox(height: 8), // زيادة المسافة بين الأيقونة والنص
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class ImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: ListView(
        children: [
          

                              Image.network('https://cdn.pixabay.com/photo/2018/05/14/13/44/natural-3400005_960_720.jpg'),
                  Image.network('https://cdn.pixabay.com/photo/2017/01/29/17/36/oak-tree-2018822_960_720.jpg'),
                  Image.network('https://media.istockphoto.com/id/1368265555/photo/vortex-split-view-of-blue-ocean-waters-surface.webp?s=1024x1024&w=is&k=20&c=4z4nQU-MyLkgWli9R74t-MOVa6Un5oPo2RB4xlAIVAs='),
                  Image.network('https://images.unsplash.com/photo-1622219970016-09f07c1eed36?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZW52aXJvbm1lbnRhbCUyMGF3YXJlbmVzc3xlbnwwfHwwfHx8MA%3D%3D'),
                  Image.network('https://media.istockphoto.com/id/1496934851/photo/recycling-waste-concept-recycling-sig-green-grass-in-the-forest-idea-for-reuse-for-recycling.jpg?s=612x612&w=0&k=20&c=tKxAEt91_KZCQNv4ZrxTTa5dHRDEeaLoiQ-OSy3E0JI='),
                  Image.network('https://media.istockphoto.com/id/1357100289/photo/green-threads-wave.jpg?s=612x612&w=0&k=20&c=ZKxezd611PuPHjmyLtwiRZxgi3feRgw0byb-lfDeOJ8='),
                  Image.network('https://media.istockphoto.com/id/1340716614/photo/abstract-icon-representing-the-ecological-call-to-recycle-and-reuse-in-the-form-of-a-pond.jpg?s=612x612&w=0&k=20&c=CglVAOWBC02qDc6Wa2ltd1L-lBVPTaYahFDEXJa4ido='),
          Image.network('https://media.istockphoto.com/id/1623003941/vector/illustration-of-flowers-on-green-background.jpg?s=612x612&w=0&k=20&c=jgwRygzVP_6DnOGwsobFDS19AyFqu7nJ1H4GCNYU9oc='),
                   Image.network('https://media.istockphoto.com/id/1450272068/photo/wind-sun-and-water-energy.jpg?s=612x612&w=0&k=20&c=ZisUNSqxdrnH-L7-CuUBBAVCdkE3CY8GEAPsVMgWy6M='),
                   Image.network('https://media.istockphoto.com/id/1181366400/photo/in-the-hands-of-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-on.jpg?s=612x612&w=0&k=20&c=jWUMrHgjMY9zQXsAwZFb1jfM6KxZE16-IXI1bvehjQM='),
                   Image.network('https://media.istockphoto.com/id/1337232523/photo/high-angle-view-of-a-lake-and-forest.jpg?s=612x612&w=0&k=20&c=72ZZZG5jNaEE0QRq6o4pUk3CI0gG-Lw5AeWQUVgO7zQ='),
          Image.network('https://media.istockphoto.com/id/1392708458/vector/lotus-flower-pattern.jpg?s=612x612&w=0&k=20&c=YWDbTORpY4oKEInpGSYGFAhtmVXRKaG21yRmgriRZQo='),
  

          // يمكنك إضافة المزيد من الصور هنا
        ],
      ),
    );
  }
}





                 

  
  
  
  
  
  
  
class RecyclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecycleContent(),
    );
  }
}

class RecycleContent extends StatefulWidget {
  @override
  State<RecycleContent> createState() => _RecycleContentState();
}

class _RecycleContentState extends State<RecycleContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(30.0), // Adding 30 padding on all sides
        child: Column(
          children: [
            // Section 1
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                      spreadRadius: 2, // Spread radius of the shadow
                      blurRadius: 5, // Blur radius of the shadow
                      offset: Offset(0, 3), // Offset of the shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 50),
                      Text('Recycling ...'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Section 2
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                            spreadRadius: 2, // Spread radius of the shadow
                            blurRadius: 5, // Blur radius of the shadow
                            offset: Offset(0, 3), // Offset of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('You Recycled'),
                          Text('15'),
                          Text('Times!'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                            spreadRadius: 2, // Spread radius of the shadow
                            blurRadius: 5, // Blur radius of the shadow
                            offset: Offset(0, 3), // Offset of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Charity Recycling'),
                          Text('5'),
                          Text('Times!'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // القسم الثالث
            Expanded(
              flex: 2,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstRRRPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // تكبير حجم الزر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // جعل الحواف ناعمة
                    ),
                  ),
                  child: Text('Recycling order'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstRRRPage extends StatefulWidget {
  @override
  _FirstRRRPageState createState() => _FirstRRRPageState();
}

class _FirstRRRPageState extends State<FirstRRRPage> {
  List<bool> _selections = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
            
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
               child: Text(
          'choose your type of recycling',
          style: TextStyle(
            fontSize: 24, // تكبير حجم الخط
            fontWeight: FontWeight.bold, // جعل الخط عريض
          ),
        ),
      ),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Food recycling'),
                value: _selections[0],
                onChanged: (bool? value) {
                  setState(() {
                    _selections[0] = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Paper recycling'),
                value: _selections[1],
                onChanged: (bool? value) {
                  setState(() {
                    _selections[1] = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Plastic recycling'),
                value: _selections[2],
                onChanged: (bool? value) {
                  setState(() {
                    _selections[2] = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Clothes recycling'),
                value: _selections[3],
                onChanged: (bool? value) {
                  setState(() {
                    _selections[3] = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Wastes recycling'),
                value: _selections[4],
                onChanged: (bool? value) {
                  setState(() {
                    _selections[4] = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Other'),
                value: _selections[5],
                onChanged: (bool? value) {
                  setState(() {
                    _selections[5] = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Second2Page()),
                  );
                },
                child: Text('next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Second2Page extends StatefulWidget {
  @override
  _Second2PageState createState() => _Second2PageState();
}

class _Second2PageState extends State<Second2Page> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

 
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
            
          ],
        ),
      ), // تغيير لون الـAppBar
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'select a day:',
              style: TextStyle(
                fontSize: 24, // تكبير حجم الخط
                fontWeight: FontWeight.bold, // جعل الخط عريض
              ),
            ),
               SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // تكبير حجم الزر
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // جعل الحواف ناعمة
                ),
              ),
              child: Text("${selectedDate.toLocal()}".split(' ')[0]),
            ),
            SizedBox(height: 50),
            Text(
              'select a time',
              style: TextStyle(
                fontSize: 24, // تكبير حجم الخط
                fontWeight: FontWeight.bold, // جعل الخط عريض
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // تكبير حجم الزر
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // جعل الحواف ناعمة
                ),
              ),
              child: Text("${selectedTime.format(context)}"),
            ),
            SizedBox(height: 130),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThankYouPage()),
                );
              },
              child: Text('book now'),
            ),
          ],
        ),
      ),
    );
  }
}


class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
            
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Thank you for saving our environment!',
                  style: TextStyle(
                    fontSize: 24, // تكبير حجم الخط
                    fontWeight: FontWeight.bold, // جعل الخط عريض
                  ),
                  textAlign: TextAlign.center, // محاذاة النص في الوسط
                ),
              ),
            ),
           // إضافة مسافة بين النص والزر
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(name: 'User')),
                );
              },
              child: Text('Done'),
            ),
             SizedBox(height: 100), 
          ],
        ),
      ),
    );
  }
}






class SettingsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('User Name'),
          accountEmail: Text('user@example.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAxlBMVEX///8AESH///0AABjBxsoAAAABEiL8/Pz///wAABMAAAoAAA0AESIAEiD+/f8AABEADR8EFCUAER0AAxsADRwAAAb3+PoADCC7vsADFCAABh0AEScEFiXT2Nz5+fcADB/f4eXt8fGkqq+Sl5tLUV6Xn6IsLzc/QUdUWF98gYmLj5Q2OULP0tTm5+mVmaR1eH4YHCQgJi9na3JKTlUADi5BSVausrkkKzk0OE4QGCFqb3aEiIs3Pkw6QEtcYmcoLj0AByMXHC93JulvAAAI+klEQVR4nO2de3faOBOHZRlZvmOBMRB8DQkBArmUt+xm00273/9LvSP3Eko4LXaLjXrm6R9NOPSgHyPPRZ5xCUEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBKmM73Nqwl/yR2JSSghve0m/F5AHsjjIoiaoowD87vttr+u34dNSGFmvOp1Rp5MU8POfpRBYJ3fz24deaHX1cPx4++4yL/6onbpa3NpMvxgKz9M0bTK8cJizma7bXtavwrnPOezOYvs/ZmWG9j2iz9j7VQQXpg+7lba92FpwTlNY/vaGZULz9gRqrvBCp/uSlH6HK7pfQSDJ3zFrooXGG4lxGHvhxGLLNfhZrqbPiagZbS0ncIUhQmN/l2oCVLpuwP5KiKoKIUYsnCAG84G6NwIN2KdDTzMMPbgkqXIKwSg+94s529d1iIAtiXQ3XCV3w1OapsUL09wjFIqATUlK1YqOPniP9Mo2xFEKhZBWNIlKWxXiYHTPQOAxCqXPYZfSiipBySUDLyLGRwj0PK/X0xNCVbKhSTr25BjzfUP/q1DK09Dopj+spFAMntVK3a5ZIKopdNlKJYX5Y3aUj3nFE848anvZFVgy4b7JtX9Iz510O20v+0h8bhYsc41qCt3Y0/8uz3PaXv9PoaDwmrlvE9GfKITamCWqKCyu+ody7Z8Qh/aSKHF045Oka2hxRX2aCL3wpqAK1FGwy667XlUDQoVhlNtUAYVwIW36lfV9BmoM8/yDok+KWbV05pXuC6Hnr5CTVVgx2n9jeKuCQkpGTlhX4WPe9vKPwIS6qbIj/cLEWSlR6U/t6p70M541anvxR0Dps1NbYVcFhZwuunU9jWdvVSj06XO3tg2d0fm7UvAUS6da8buj0BrR8/c0lNw5vZoKVSkRt/YxJ2yHGD4lKhzWmJ2wWvG7o3AWKZDT+Ob6IaipUN+okLX5JrnVayq0F/Jw/9wBhQureolfvp116PkLJD4lHVYjIIaxFjzmCphQpm3r2zd9CccY0dD/iZS4PQMxGzJTo+I2NUJNsJEKsYJwDjUwq64QNFpEnT6pK6figbDsPmHXbS+7Ah2n8mmb279VqUeKvxtUVBgKdtn2qiuRhxXPagxrE51/WfGKSaasWgkVsA5J2152BTgl75wwDt1jbnUPYy/0YI8qcBi8AyX5LAvjo/wNBAqD/ROZSrXv+ZC75XbmGsdcjZ4m7A+FaSpQ3r9S9nB1nrKjbkF5mrNZm6laLZg84j6UwoOLozyq8yE34UtRIif9Dk7zmSMbSw0P2K+K4SV4PRTDCXtXKLVBd+Akf2GBKO341ufIGlIIQ2fLiKrXfVkC7oaSqWXHZffsfp5qBPDqJGCzrUL59h7gbso2aNs6dG4jiw9j8LQsiMJt3tIyJolG71nZKrwvccjY/YrADuVEqZa2Q6yeZ0zPAsMbu67huuOxF+jW4A8YuNhhPbr/+KQP7K4FDGzr8d9lp2h7Ub+R8jrz887l3WJxv3i+23ak9biqMeIAXM6qlTN5lJdx3QTgRTU96CHAhn4JJeUfOX4o8zqFbejLoSdKojUpxw598tZbSnk+B0OaZB3JaQSuVCc7SSECRJ2Xm2n0WcbbiPflZfgupjcvneizZHUAgxWXH1k3Y7NLcJlm+rYlD16AfADeNmNZl33cwtsUqvFpuXBLE8Lt24+LRDb/7ltI/l4ki0e7L98WDmaXayXOg7+w3bCLSc+DpHviZsyeT5MDb0qmc3swdCehJsa9yQXbbBtfZ1XkcTcEAbK6Yv3dWbWgz5h+dT1a5UWa8jQt8tXo+kpnrL+TsBpGn11BEgf/nvNz3a/SMZp+dP1k7d1cCwMjtGwnmN1s5vP55mYWOLYe7h3GwXdiPVxHPk1peq5Ox0/BdyRzNhwa2ncaY5mOCtd1s76u6/0MfhKBIVyxJ3E4ZPME/NLZpgJ+SvnWsgLhud8rNDzNFT2v1/PKl+UPPdd9WzIaIrC6W26ercLI5AsnEBOvB4vd3aY9zwMbghEn8jzDm4AJ4TdQuqvOkO8D21rP1DzD6xDWxLmZf2B12zBecdn7tWyG5ud1O5iCkyTJxjHqNl6+Esdsk8iU57zcjRxxTYbWgan0ynhhbF0k5NwqD9mfEGZggLpNezsKhRsE4xU5MxtGJAk/aZ6nVZs6PEQg3Lj36emMuoW5rPXMDgt+fYPuMGQdU04InYNM2E0pTWYXle/c/wjPyGZJ+eW1LU8CEbr4Tx/++hW4q1AL9P+KM+mQ4pRH825w3L3CYxFaHDrz6DwOOiBOLAZeHMZ1J2UOMRFhbAyWrRfFMipzOWBRt3X9x7jy1re8GNsz5Oe8Iwnr9pP+jCBMvn1KewrTaF67c/1nyOln+YCwFi9G+eGLqs1Bx+MabNGuQHmF5Kwsz0+CcEOWkzbPNKhpRnPrNOq+YM0js8VGG4jI2xP50a+4bNtmdzsnxeOp/OhXgseiRV9KydI5sUBNc6YtnhTT4qniAz6qI8KHoi2FsHcWA/Fba6YDeAIiRisBQ35mPssqPuCjhkI3m+WtBEWZz9yxU0XCV+AD2F0bmZssv+mn8OQCoYrygglppdrnZMQMLz71Lg1jTw5itKAP6t6XuhNcVdFfItp8YkNJ3jt1tP9KEObNJzZUPiqpIYHga1qp9v3bi8YUXty28Zja1dPvPJj5MZOnQ7fJTwsn13WmDGsiZ6Ia96ZQGJ62btrFtZp/mBstBqfPZ75hGIPm0+9ao7D1JbLmn0WwZCdPul/xXIgXzULJ3Bo350uHY2vedLhY32a9Bj1NL2t8/nIVit6py/tX4LPCVcMKRwO3sbQUEtOeO2j68UOXdjBuUOE4sJseop06olGFwpk2rPCauY1eh27js+wj22jUhobd9HUI0WLcoA3HzUcLcse8BiO+x+6aFsjB19hZduRz5X8B2Yqa2eBnmq6eOOGr+9mDY3X109LtOg+z+1XzR8LlBEWUrzqnZ5VH5X9a07DCcoTJl2MTJj0lZtkUlbaij5cDWyc/5Cu/QN6KDREEQRAEQRAEQRAEQRAEQRAEQRAEQRAEQRAEQRAEQRAEOUf+D16qo9VlJXh3AAAAAElFTkSuQmC'),
          ),
        ),
        ListTile(
          title: Text('Kuwaiti Environmental Laws'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EnvironmentalLawsPage()),
            );
          },
        ),
        ListTile(
          title: Text('Kuwait Environment'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KuwaitEnvironmentPage()),
            );
          },
        ),
        ListTile(
          title: Text('Our Works!'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OurWorkPage()),
            );
          },
        ),
        ListTile(
          title: Text('FAQ'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FAQPage()),
            );
          },
        ),
        ListTile(
          title: Text('Chat Us'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage()),
            );
          },
        ),
        ListTile(
          title: Text('Volunteer with Us'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VolunteerChatPage()),
            );
          },
        ),
      ],
    );
  }
}
class EnvironmentalLawsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
            
          ],
        ),
      ),
       body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              'قانون حماية البيئة رقم 42 لسنة 2014:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يشمل هذا القانون العديد من الأحكام المتعلقة بحماية البيئة، بما في ذلك إنشاء شرطة بيئية ومراقبين بيئيين في المؤسسات العامة.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15), // Space between items

            Text(
              'قانون منع تلويث المياه الصالحة للملاحة بالزيت رقم 12 لسنة 1964:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يهدف إلى حماية المياه من التلوث بالزيت والمواد الضارة الأخرى.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15), // Space between items

            Text(
              'قانون المحافظة على مصادر الثروة البترولية رقم 19 لسنة 1973:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يهدف إلى حماية الموارد البترولية من الاستنزاف والتلوث.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15), // Space between items

            Text(
              'قانون تنظيم استخدام الأشعة المؤينة والوقاية من مخاطرها رقم 131 لسنة 1977:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يهدف إلى حماية البيئة والإنسان من مخاطر الإشعاع.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15), // Space between items

            Text(
              'قانون حظر بعض الأفعال المضرة بالنظافة العامة والمزروعات رقم 9 لسنة 1987:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يهدف إلى حماية النظافة العامة والمزروعات من الأفعال الضارة.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15), // Space between items

            Text(
              'قانون مكافحة التدخين رقم 15 لسنة 1995:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يهدف إلى حماية الصحة العامة من أضرار التدخين.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15), // Space between items

            Text(
              'قانون إنشاء الهيئة العامة للبيئة رقم 21 لسنة 1995:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يهدف إلى تنظيم وإدارة الشؤون البيئية في الكويت.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15), // Space between items

            Text(
              'قانون بلدية الكويت رقم 5 لسنة 2005:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يشمل أحكامًا تتعلق بحماية البيئة والنظافة العامة.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15), // Space between items

            Text(
              'قانون العمل في القطاع الأهلي رقم 6 لسنة 2010:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يتضمن أحكامًا لحماية البيئة في أماكن العمل.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15), // Space between items

            Text(
              'قانون حماية البيئة المعدل رقم 99 لسنة 2015:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'يتضمن تعديلات على قانون حماية البيئة الأصلي لتعزيز الحماية البيئية.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
 


class KuwaitEnvironmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
            
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text('الكويت، كدولة صغيرة تقع في منطقة الخليج العربي، تواجه تحديات بيئية متعددة تتطلب اهتمامًا خاصًا. البيئة الكويتية تتأثر بعوامل عديدة مثل التوسع العمراني السريع، والتلوث الصناعي، والتغيرات المناخية. تعاني الكويت من مستويات عالية من تلوث الهواء بسبب الانبعاثات الصناعية وعوادم السيارات، مما يؤثر سلبًا على صحة السكان وجودة الحياة. كما تتعرض المياه الساحلية للتلوث بسبب الأنشطة النفطية والتسربات النفطية، مما يؤثر على الحياة البحرية والنظام البيئي البحري. تعتمد الكويت بشكل كبير على تحلية مياه البحر لتلبية احتياجاتها من المياه العذبة، مما يضع ضغطًا على الموارد المائية. إدارة النفايات الصلبة تمثل تحديًا كبيرًا، حيث تتزايد كميات النفايات الناتجة عن الأنشطة البشرية والصناعية. لتعزيز حماية البيئة، تحتاج الكويت إلى تطبيق وتنفيذ قوانين بيئية صارمة، وزيادة الوعي البيئي بين السكان من خلال حملات توعية وبرامج تعليمية، وتشجيع استخدام مصادر الطاقة المتجددة مثل الطاقة الشمسية والرياح، وتطوير أنظمة فعالة لإدارة النفايات وإعادة التدوير، وإنشاء محميات طبيعية لحماية الأنواع المهددة بالانقراض. من خلال التركيز على هذه الاحتياجات، يمكن للكويت أن تحقق توازنًا بين التنمية الاقتصادية وحماية البيئة، مما يضمن مستقبلًا مستدامًا للأجيال القادمة. '),
        ),
      ),
    );
  }
}

class OurWorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
            
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أعمالنا',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15), // Space between title and content
            Text(
              'تلتزم شركتنا بالحفاظ على البيئة وحماية الحيوانات الضالة من خلال مجموعة متنوعة من الأنشطة التطوعية. نسعى جاهدين لتعزيز الوعي البيئي بين أفراد المجتمع من خلال حملات التوعية وورش العمل التعليمية. كما نقوم بتنظيم حملات تنظيف الشواطئ والحدائق العامة، بالإضافة إلى برامج إعادة التدوير التي تهدف إلى تقليل النفايات وتعزيز الاستدامة.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 15), // Space between paragraphs
            Text(
              'فيما يتعلق بالحيوانات الضالة، نعمل على توفير المأوى والرعاية الطبية اللازمة لها، بالإضافة إلى تنظيم حملات التبني لضمان حصولها على منازل دائمة وآمنة. من خلال هذه الجهود، نهدف إلى خلق بيئة أكثر نظافة واستدامة، وتحسين جودة الحياة لكل من البشر والحيوانات على حد سواء.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
            
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            FAQItem(
              question: 'ما هي الأنشطة التطوعية التي تنظمها الشركة؟',
              answer:
                  'تنظم الشركة مجموعة متنوعة من الأنشطة التطوعية، تشمل حملات تنظيف الشواطئ والحدائق العامة، وتوفير المأوى والرعاية الطبية للحيوانات الضالة، بالإضافة إلى تنظيم حملات التبني لضمان حصولها على منازل دائمة وآمنة.',
            ),
            FAQItem(
              question: 'كيف يمكنني المشاركة في الأنشطة التطوعية؟',
              answer:
                  'يمكن للأفراد المشاركة في الأنشطة من خلال التسجيل عبر موقع الشركة الإلكتروني أو التواصل معنا عبر وسائل التواصل الاجتماعي.',
            ),
            FAQItem(
              question: 'كيف يمكنني دعم أنشطة الشركة؟',
              answer:
                  'يمكن دعم أنشطة الشركة من خلال التبرعات التي تساهم في استدامة برامجنا. نحن نعمل على بناء شراكات مع الجهات الحكومية والخاصة لتعزيز جهودنا وضمان استدامة برامجنا البيئية والإنسانية.',
            ),
            FAQItem(
              question: 'كيف تعزز الشركة الوعي البيئي بين أفراد المجتمع؟',
              answer:
                  'نسعى لتعزيز الوعي البيئي من خلال ورش العمل التعليمية وحملات التوعية.',
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(answer),
        ),
      ],
    );
  }
}



class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.insert(0, Message(
          text: _controller.text,
          isUser: true, // Assuming messages sent here are from the user
          timestamp: DateTime.now(),
        ));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('دردشة'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Display messages from bottom to top
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: message.isUser ? Colors.blue[200] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.text,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _formatTimestamp(message.timestamp),
                          style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'اكتب رسالة...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _handleSend,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    if (difference.inDays > 1) {
      return '${timestamp.month}/${timestamp.day}';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inHours > 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 1) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

class Message {
  final String text;
  final bool isUser; // Indicates if the message is from the user
  final DateTime timestamp;

  Message({required this.text, required this.isUser, required this.timestamp});
}


class VolunteerChatPage extends StatelessWidget {
  final List<String> images = [
    'https://media.istockphoto.com/id/1220728836/photo/tropical-island-palm-tree-beach-from-above.jpg?s=612x612&w=0&k=20&c=1cYuKjGdtJwPRYT-iHk4S49C2-fq-U05JPzD66wR9BE=',
    'https://media.istockphoto.com/id/1408217246/photo/esg-environment-social-governance-investment-business-concept-women-use-a-computer-to-analyze.jpg?s=612x612&w=0&k=20&c=5pMjmO-i84KQX0UzJkf4Ba92HkQZDLdcF3QRBEn3w1U=',
    'https://media.istockphoto.com/id/1324099927/photo/friends-red-cat-and-corgi-dog-walking-in-a-summer-meadow-under-the-drops-of-warm-rain.jpg?s=612x612&w=0&k=20&c=ZQiqn4SPj_7WhjhbahGJ1UwaJMrwuuSkJRjYAi9YYx0=',
    'https://media.istockphoto.com/id/1400218353/photo/green-technology-environmental-technology-concept-sustainable-development-goals-sdgs.jpg?s=612x612&w=0&k=20&c=xdD0sXbA9GHytb9TV8Q_1Wg560aZTY2JaICZx-mEVoc=',
    'https://media.istockphoto.com/id/1342229204/photo/a-lake-in-the-shape-of-a-recycling-sign-in-the-middle-of-untouched-nature-an-ecological.jpg?s=612x612&w=0&k=20&c=AENL8ZdXCJQN_q0hxCYEG1LxoOckfCezV8W206WB3k4=',
    'https://media.istockphoto.com/id/585288480/photo/bottle.jpg?s=612x612&w=0&k=20&c=sn0zHZv4pA8f7aM-uYQ73DVJnvDUzZSXqTbHurC492U=',
    'https://media.istockphoto.com/id/1403641144/photo/urban-farming.jpg?s=612x612&w=0&k=20&c=POXSSpgd2IwIojeQa_W9U4FEvEz3_1IA1g0sin0512I=',
    'https://media.istockphoto.com/id/1125649835/photo/elephant-drinking-water-by-the-river.jpg?s=612x612&w=0&k=20&c=Ggiq0JippW5cZzb7FtnxFCzGu2fugAuG8l3ffXK4wYA=',
    'https://media.istockphoto.com/id/1317323736/photo/a-view-up-into-the-trees-direction-sky.jpg?s=612x612&w=0&k=20&c=i4HYO7xhao7CkGy7Zc_8XSNX_iqG0vAwNsrH1ERmw2Q=',
  ];

  final List<String> titles = [
    'تنظيف الشواطئ',
    'التوعية البيئية',
    'ملاجئ القطط والكلاب',
    'الحياة الطبيعية للمنطقة',
    'إعادة التدوير',
    'بدائل البلاستيك',
    'الزراعة الحضرية',
    'حماية الحياة البرية',
    'زراعة الأشجار',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1957717728/vector/sustainability-and-environmental-themed-in-bauhaus-style-a-vector-composition-consisting-of.jpg?s=612x612&w=0&k=20&c=kUXHHYHusyqaYNDGbiL_zjIpKg_-5HMc4GWRpXnukg0=',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        titles[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThanksPage(),
                            ),
                          );
                        },
                        child: Text('تطوع الآن'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ThanksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('شكرا'),
      ),
      body: Center(
        child: Text(
          'شكرا لتطوعك! سيتم التواصل معك قريبا.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
