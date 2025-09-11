import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

// --- الألوان الرئيسية للتطبيق ---
class AppColors {
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color lightGreen = Color(0xFF81C784);
  static const Color backgroundGreen = Color(0xFF2E7D32);
  static const Color textLight = Colors.white;
  static const Color textDark = Colors.black;
}
final List<String> titles = [
  'تنظيف الشواطئ',
  'توعية المجتمع',
  'العناية بالحيوانات',
  'زراعة الأشجار',
  'فرز النفايات',
  'حملات إنقاذ الطبيعة',
];

final List<String> images = [
   
    'assets/pexels-mali-142497.jpg',
    'assets/pexels-mattycphoto-580900.jpg',
    'assets/pexels-obviouslyarthur-1296265.jpg',
    'assets/pexels-packermann-1666021.jpg',
    'assets/pexels-pixabay-459225.jpg',
    'assets/pexels-scottwebb-1048033.jpg',
 ];


// --- متحكم الثيم (الوضع الداكن/الفاتح) ---
class AppTheme {
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.dark);

  static void toggle() {
    themeMode.value = themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }
}

// --- تعريف الثيمات ---
final ThemeData kDarkTheme = ThemeData.dark().copyWith(
  primaryColor: AppColors.primaryGreen,
  scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkGreen,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkGreen,
    selectedItemColor: AppColors.lightGreen,
    unselectedItemColor: Colors.white54,
    showUnselectedLabels: false,
  ),
  textTheme: ThemeData.dark().textTheme.apply(bodyColor: Colors.white),
  cardColor: const Color.fromARGB(255, 45, 45, 45),
);

final ThemeData kLightTheme = ThemeData.light().copyWith(
  primaryColor: AppColors.primaryGreen,
  scaffoldBackgroundColor: const Color(0xFFF6FFF0),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundGreen,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.darkGreen,
    unselectedItemColor: Colors.black54,
    showUnselectedLabels: false,
  ),
  textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.black),
  cardColor: Colors.white,
);

// --- شريط العنوان الموحد مع صورة ---
PreferredSize appBarWithImage(String title, {List<Widget>? actions}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Image.asset(
        'assets/World environment day web template illustration with modern eco geometric nature mosaic green abstr | Premium Vector-2.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      actions: actions,
    ),
  );
}

// --- الويدجت الرئيسية للتطبيق ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppTheme.themeMode,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Recycling App',
          theme: kLightTheme,
          darkTheme: kDarkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}

// --- شاشة البداية (Splash Screen) ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.asset(
  'assets/1.png',
  fit: BoxFit.cover, // يخليها تتمدد أو تتناسب
),
      ),
    );
  }
}

// --- صفحات التعريف بالتطبيق (Onboarding) ---
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
          Image.network(
            image,
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(subtitle),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => nextPage),
                      );
                    },
                    child: const Text('Next'),
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

// --- صفحة تسجيل الدخول / إنشاء حساب ---
class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/World environment day web template illustration with modern eco geometric nature mosaic green abstr | Premium Vector-2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withAlpha(51),
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
                    backgroundColor: AppColors.lightGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(name: emailController.text.isNotEmpty ? emailController.text : "User"),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Log In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- صفحة إدخال بيانات المستخدم الجديد ---
class DataEntryPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  DataEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('Hello!'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage(name: nameController.text.isNotEmpty ? nameController.text : "User"),
                ));
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- شريط العنوان المخصص داخل التطبيق ---
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String name;
  final int coins;

  const CustomAppBar({super.key, required this.title, required this.name, required this.coins});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.monetization_on, color: Colors.yellow, size: 16),
                const SizedBox(width: 6),
                Text('Coins: $coins', style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Image.asset(
        'assets/World environment day web template illustration with modern eco geometric nature mosaic green abstr | Premium Vector-2.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// --- شريط التنقل السفلي المخصص ---
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.darkGreen,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.lightGreen,
      unselectedItemColor: Colors.white54,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.recycling), label: 'Recycle'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onTap: onTap,
    );
  }
}

// --- الصفحة الرئيسية للتطبيق (الحاوية) ---
class HomePage extends StatefulWidget {
  final String name;
  final int coins = 500;
  final int initialIndex;

  const HomePage({super.key, required this.name, this.initialIndex = 0});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pages = [
      const HomeContent(),
      const RecycleContent(),
      const SettingsContent(),
    ];
  }

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

// --- محتوى الصفحة الرئيسية ---
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    const int recycleCount = 15;
    const bool isRecyclingInProgress = true;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/World environment day web template illustration with modern eco geometric nature mosaic green abstr | Premium Vector-2.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Protect the Planet',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.textLight, fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Small actions lead to big changes',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VolunteerChatPage ()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightGreen,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 4,
                      ),
                      child: const Text('Get Involved', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Our Fields', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildIcon(Icons.local_florist, 'Plants'),
                  _buildIcon(Icons.checkroom, 'Clothes'),
                  _buildIcon(Icons.volunteer_activism, 'Volunteer'),
                  _buildIcon(Icons.pets, 'Pets'),
                  _buildIcon(Icons.public, 'Earth'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 30, 16, 10),
              child: Text('نشاطك في إعادة التدوير', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const Icon(Icons.recycling, color: AppColors.primaryGreen, size: 40),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isRecyclingInProgress ? 'يتم الآن استلام طلبك!' : 'أتممت $recycleCount عملية تدوير',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              isRecyclingInProgress ? 'شكراً لمساهمتك في حماية البيئة.' : 'استمر في عملك الرائع!',
                              style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text('Latest Studies', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StudiesPage()));
                    },
                    child: const Text('See all studies', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildStudyCard(
                    title: 'Environment',
                    subtitle: 'Impact of human activity on ecosystems and biodiversity.',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const StudyDetailPage(
                          title: 'Environment',
                          content: 'The environment in Kuwait, like in many arid regions, is uniquely vulnerable to human activity and climate stressors. Over the last three decades, biodiversity loss has accelerated due to urban expansion, overgrazing, and pollution from oil industries. Studies by the Kuwait Environment Public Authority (EPA) have shown that desert ecosystems are under intense pressure, with native plant cover declining by over 40% in some regions. Biodiversity surveys indicate that several bird and reptile species face local extinction risks due to habitat fragmentation. Marine ecosystems, particularly coral reefs in the northwestern Arabian Gulf, have also experienced coral bleaching and declining fish populations linked to rising sea temperatures and pollution. This evidence underscores the need for stronger conservation strategies, integrated land-use planning, and regional cooperation to restore ecosystem balance. Current recommendations include habitat restoration, stricter enforcement of environmental laws, and greater investment in public education on sustainable practices.',
                          imageUrl: 'https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                        ),
                      ));
                    },
                  ),
                  _buildStudyCard(
                    title: 'Recycling',
                    subtitle:'Benefits, processes and best practices for recycling.',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const StudyDetailPage(
                          title: 'Recycling',
                          content:'Recycling practices in Kuwait remain at a developing stage, despite increasing public awareness. According to a 2023 report from Kuwait Institute for Scientific Research (KISR), less than 10% of municipal solid waste is currently recycled, with the majority ending up in landfills. This is concerning, as Kuwait produces one of the highest per capita waste levels globally, averaging nearly 1.5 kg per person per day. Pilot recycling programs, such as neighborhood collection bins and educational campaigns in schools, have demonstrated significant potential: when residents are provided with clear guidelines and access to recycling infrastructure, participation rates rise to above 60%. Challenges include the lack of advanced sorting facilities, limited private sector investment, and insufficient regulations mandating recycling for businesses. To overcome these barriers, experts recommend establishing a national recycling authority, implementing extended producer responsibility policies, and creating economic incentives for companies that adopt circular economy models. If implemented effectively, Kuwait could reduce landfill dependency by over 40% within the next decade.',
                          imageUrl: 'https://images.pexels.com/photos/159287/recycling-recycle-environment-159287.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                        ),
                      ));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 20),
              child: Card(
                color: AppColors.darkGreen,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'هل لديك سؤال أو اقتراح؟',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'نحن هنا للاستماع إليك. تواصل معنا عبر صفحة المحادثة.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightGreen,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('تواصل معنا الآن', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: AppColors.darkGreen,
              child: const Text(
                '© 2025 Greenie. All rights reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, String label) {
    return Container(
      width: 90,
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.darkGreen.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.lightGreen, size: 36),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: AppColors.textLight)),
        ],
      ),
    );
  }

  Widget _buildStudyCard({
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 6)],
        ),
        child: Row(
          children: [
            Container(
              width: 72,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.menu_book, color: Colors.white, size: 32),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: const TextStyle(color: AppColors.textLight, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}

// --- صفحة إعادة التدوير المحسنة ---

// نموذج بيانات طلب إعادة التدوير
class RecycleOrder {
  final String id;
  final DateTime date;
  final List<String> materials;
  final String status; // pending, collected, in_progress, completed
  final int points;
  final String address;

  RecycleOrder({
    required this.id,
    required this.date,
    required this.materials,
    required this.status,
    required this.points,
    required this.address,
  });
}

// نموذج بيانات المواد القابلة لإعادة التدوير
class RecycleMaterial {
  final String name;
  final String nameAr;
  final IconData icon;
  final String description;
  final String tips;
  final int pointsPerKg;
  final Color color;

  RecycleMaterial({
    required this.name,
    required this.nameAr,
    required this.icon,
    required this.description,
    required this.tips,
    required this.pointsPerKg,
    required this.color,
  });
}

// محتوى صفحة إعادة التدوير المحسن
class RecycleContent extends StatefulWidget {
  const RecycleContent({super.key});

  @override
  State<RecycleContent> createState() => _RecycleContentState();
}

class _RecycleContentState extends State<RecycleContent> with TickerProviderStateMixin {
  late TabController _tabController;
  
  // بيانات وهمية للطلبات السابقة
  final List<RecycleOrder> _orders = [
    RecycleOrder(
      id: 'REC001',
      date: DateTime.now().subtract(const Duration(days: 2)),
      materials: ['البلاستيك', 'الورق'],
      status: 'completed',
      points: 25,
      address: 'الجابرية، الكويت',
    ),
    RecycleOrder(
      id: 'REC002',
      date: DateTime.now().subtract(const Duration(days: 7)),
      materials: ['الزجاج', 'المعادن'],
      status: 'completed',
      points: 30,
      address: 'السالمية، الكويت',
    ),
  ];

  // الطلب الحالي
  final RecycleOrder? _currentOrder = RecycleOrder(
    id: 'REC003',
    date: DateTime.now(),
    materials: ['البلاستيك', 'الورق', 'الزجاج'],
    status: 'in_progress',
    points: 35,
    address: 'حولي، الكويت',
  );

  // إجمالي النقاط
  final int _totalPoints = 500;

  // المواد القابلة لإعادة التدوير
  final List<RecycleMaterial> _materials = [
    RecycleMaterial(
      name: 'Plastic',
      nameAr: 'البلاستيك',
      icon: Icons.local_drink,
      description: 'زجاجات المياه، العبوات البلاستيكية، الأكياس',
      tips: 'اغسل العبوات جيداً وأزل الملصقات',
      pointsPerKg: 5,
      color: Colors.blue,
    ),
    RecycleMaterial(
      name: 'Paper',
      nameAr: 'الورق',
      icon: Icons.description,
      description: 'الصحف، المجلات، الكرتون، أوراق المكتب',
      tips: 'تأكد من جفاف الورق وعدم تلوثه بالطعام',
      pointsPerKg: 3,
      color: Colors.brown,
    ),
    RecycleMaterial(
      name: 'Glass',
      nameAr: 'الزجاج',
      icon: Icons.wine_bar,
      description: 'زجاجات المشروبات، البرطمانات الزجاجية',
      tips: 'أزل الأغطية المعدنية واغسل الزجاج',
      pointsPerKg: 8,
      color: Colors.green,
    ),
    RecycleMaterial(
      name: 'Metal',
      nameAr: 'المعادن',
      icon: Icons.build,
      description: 'علب الألمنيوم، الحديد، النحاس',
      tips: 'نظف المعادن من الصدأ والأوساخ',
      pointsPerKg: 10,
      color: Colors.grey,
    ),
    RecycleMaterial(
      name: 'Electronics',
      nameAr: 'الإلكترونيات',
      icon: Icons.phone_android,
      description: 'الهواتف القديمة، أجهزة الكمبيوتر، البطاريات',
      tips: 'احذف البيانات الشخصية قبل التسليم',
      pointsPerKg: 15,
      color: Colors.purple,
    ),
    RecycleMaterial(
      name: 'Organic',
      nameAr: 'المواد العضوية',
      icon: Icons.eco,
      description: 'بقايا الطعام، أوراق الأشجار، قشور الفواكه',
      tips: 'تأكد من عدم وجود لحوم أو منتجات ألبان',
      pointsPerKg: 2,
      color: Colors.orange,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // شريط التبويب
          Container(
            color: Theme.of(context).cardColor,
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryGreen,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.primaryGreen,
              tabs: const [
                Tab(icon: Icon(Icons.home), text: 'الرئيسية'),
                Tab(icon: Icon(Icons.track_changes), text: 'تتبع الطلب'),
                Tab(icon: Icon(Icons.info), text: 'المواد'),
                Tab(icon: Icon(Icons.history), text: 'السجل'),
              ],
            ),
          ),
          // محتوى التبويبات
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMainTab(),
                _buildTrackingTab(),
                _buildMaterialsTab(),
                _buildHistoryTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // التبويب الرئيسي
  Widget _buildMainTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // بطاقة النقاط
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [AppColors.primaryGreen, AppColors.lightGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.stars, color: Colors.white, size: 40),
                  const SizedBox(height: 10),
                  Text(
                    '$_totalPoints نقطة',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'إجمالي نقاطك',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          // إحصائيات سريعة
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'عمليات التدوير',
                  '${_orders.length + (_currentOrder != null ? 1 : 0)}',
                  Icons.recycling,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatCard(
                  'الطلبات المكتملة',
                  '${_orders.where((o) => o.status == 'completed').length}',
                  Icons.check_circle,
                  Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          
          // زر طلب جديد
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImprovedFirstRRRPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 4,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle, size: 28),
                  SizedBox(width: 10),
                  Text(
                    'طلب إعادة تدوير جديد',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // تبويب تتبع الطلب
  Widget _buildTrackingTab() {
    if (_currentOrder == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox, size: 80, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'لا يوجد طلب حالي',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'اطلب خدمة إعادة التدوير لتتبع حالة طلبك',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // معلومات الطلب
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'طلب رقم: ${_currentOrder!.id}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      _buildStatusChip(_currentOrder!.status),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('التاريخ: ${_formatDate(_currentOrder!.date)}'),
                  Text('العنوان: ${_currentOrder!.address}'),
                  Text('المواد: ${_currentOrder!.materials.join(', ')}'),
                  Text('النقاط المتوقعة: ${_currentOrder!.points}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          // مراحل الطلب
          const Text(
            'مراحل الطلب',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _buildOrderSteps(_currentOrder!.status),
        ],
      ),
    );
  }

  // تبويب المواد
  Widget _buildMaterialsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'المواد القابلة لإعادة التدوير',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'تعرف على أنواع المواد التي يمكن إعادة تدويرها ونصائح التحضير',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _materials.length,
              itemBuilder: (context, index) {
                final material = _materials[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: material.color.withOpacity(0.2),
                      child: Icon(material.icon, color: material.color),
                    ),
                    title: Text(
                      material.nameAr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${material.pointsPerKg} نقاط/كيلو'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الوصف:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: material.color,
                              ),
                            ),
                            Text(material.description),
                            const SizedBox(height: 10),
                            Text(
                              'نصائح التحضير:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: material.color,
                              ),
                            ),
                            Text(material.tips),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // تبويب السجل
  Widget _buildHistoryTab() {
    if (_orders.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 80, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'لا يوجد طلبات سابقة',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'سجل الطلبات (${_orders.length})',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                final order = _orders[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getStatusColor(order.status).withOpacity(0.2),
                      child: Icon(
                        _getStatusIcon(order.status),
                        color: _getStatusColor(order.status),
                      ),
                    ),
                    title: Text('طلب رقم: ${order.id}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_formatDate(order.date)),
                        Text('المواد: ${order.materials.join(', ')}'),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStatusChip(order.status),
                        Text(
                          '+${order.points} نقطة',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // يمكن إضافة صفحة تفاصيل الطلب هنا
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // بطاقة إحصائية صغيرة
  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // شريحة حالة الطلب
  Widget _buildStatusChip(String status) {
    Color color;
    String text;
    
    switch (status) {
      case 'pending':
        color = Colors.orange;
        text = 'في الانتظار';
        break;
      case 'collected':
        color = Colors.blue;
        text = 'تم الاستلام';
        break;
      case 'in_progress':
        color = Colors.purple;
        text = 'قيد المعالجة';
        break;
      case 'completed':
        color = Colors.green;
        text = 'مكتمل';
        break;
      default:
        color = Colors.grey;
        text = 'غير معروف';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  // مراحل الطلب
  Widget _buildOrderSteps(String currentStatus) {
    final steps = [
      {'status': 'pending', 'title': 'تم استلام الطلب', 'subtitle': 'طلبك قيد المراجعة'},
      {'status': 'collected', 'title': 'تم جمع المواد', 'subtitle': 'تم استلام المواد من موقعك'},
      {'status': 'in_progress', 'title': 'قيد المعالجة', 'subtitle': 'يتم فرز ومعالجة المواد'},
      {'status': 'completed', 'title': 'اكتمل', 'subtitle': 'تم إضافة النقاط لحسابك'},
    ];

    int currentIndex = steps.indexWhere((step) => step['status'] == currentStatus);
    
    return Column(
      children: steps.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, String> step = entry.value;
        bool isCompleted = index <= currentIndex;
        bool isCurrent = index == currentIndex;
        
        return Row(
          children: [
            Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted ? AppColors.primaryGreen : Colors.grey.shade300,
                  ),
                  child: Icon(
                    isCompleted ? Icons.check : Icons.circle,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                if (index < steps.length - 1)
                  Container(
                    width: 2,
                    height: 40,
                    color: isCompleted ? AppColors.primaryGreen : Colors.grey.shade300,
                  ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isCurrent ? AppColors.primaryGreen : null,
                      ),
                    ),
                    Text(
                      step['subtitle']!,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  // دوال مساعدة
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending': return Colors.orange;
      case 'collected': return Colors.blue;
      case 'in_progress': return Colors.purple;
      case 'completed': return Colors.green;
      default: return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'pending': return Icons.schedule;
      case 'collected': return Icons.local_shipping;
      case 'in_progress': return Icons.settings;
      case 'completed': return Icons.check_circle;
      default: return Icons.help;
    }
  }
}

// صفحة اختيار المواد المحسنة
class ImprovedFirstRRRPage extends StatefulWidget {
  const ImprovedFirstRRRPage({super.key});

  @override
  _ImprovedFirstRRRPageState createState() => _ImprovedFirstRRRPageState();
}

class _ImprovedFirstRRRPageState extends State<ImprovedFirstRRRPage> {
  final Set<String> _selectedMaterials = {};
  
  final List<Map<String, dynamic>> _materials = [
    {
      'name': 'البلاستيك',
      'icon': Icons.local_drink,
      'color': Colors.blue,
      'description': 'زجاجات، عبوات، أكياس',
    },
    {
      'name': 'الورق',
      'icon': Icons.description,
      'color': Colors.brown,
      'description': 'صحف، مجلات، كرتون',
    },
    {
      'name': 'الزجاج',
      'icon': Icons.wine_bar,
      'color': Colors.green,
      'description': 'زجاجات، برطمانات',
    },
    {
      'name': 'المعادن',
      'icon': Icons.build,
      'color': Colors.grey,
      'description': 'علب، حديد، نحاس',
    },
    {
      'name': 'الإلكترونيات',
      'icon': Icons.phone_android,
      'color': Colors.purple,
      'description': 'هواتف، أجهزة، بطاريات',
    },
    {
      'name': 'المواد العضوية',
      'icon': Icons.eco,
      'color': Colors.orange,
      'description': 'بقايا طعام، أوراق شجر',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('اختر نوع المواد'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختر المواد التي تريد إعادة تدويرها',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'يمكنك اختيار أكثر من نوع واحد',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemCount: _materials.length,
                itemBuilder: (context, index) {
                  final material = _materials[index];
                  final isSelected = _selectedMaterials.contains(material['name']);
                  
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedMaterials.remove(material['name']);
                        } else {
                          _selectedMaterials.add(material['name']);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isSelected 
                            ? material['color'].withOpacity(0.2)
                            : Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected 
                              ? material['color']
                              : Colors.grey.shade300,
                          width: isSelected ? 2 : 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              material['icon'],
                              size: 40,
                              color: isSelected 
                                  ? material['color']
                                  : Colors.grey,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              material['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSelected 
                                    ? material['color']
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              material['description'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            if (isSelected)
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 20,
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
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _selectedMaterials.isNotEmpty
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Second2Page(
                              selectedMaterials: _selectedMaterials.toList(),
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _selectedMaterials.isEmpty
                      ? 'اختر مادة واحدة على الأقل'
                      : 'التالي (${_selectedMaterials.length} مواد محددة)',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// تحديث صفحة اختيار التاريخ والوقت
class Second2Page extends StatefulWidget {
  final List<String> selectedMaterials;
  
  const Second2Page({super.key, required this.selectedMaterials});

  @override
  _Second2PageState createState() => _Second2PageState();
}

class _Second2PageState extends State<Second2Page> {
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  TimeOfDay selectedTime = const TimeOfDay(hour: 9, minute: 0);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('اختر التاريخ والوقت'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عرض المواد المحددة
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'المواد المحددة:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: widget.selectedMaterials.map((material) {
                        return Chip(
                          label: Text(material),
                          backgroundColor: AppColors.lightGreen.withOpacity(0.2),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            const Text(
              'اختر موعد الاستلام',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // اختيار التاريخ
            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_today, color: AppColors.primaryGreen),
                title: const Text('التاريخ'),
                subtitle: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => _selectDate(context),
              ),
            ),
            const SizedBox(height: 10),
            
            // اختيار الوقت
            Card(
              child: ListTile(
                leading: const Icon(Icons.access_time, color: AppColors.primaryGreen),
                title: const Text('الوقت'),
                subtitle: Text(selectedTime.format(context)),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => _selectTime(context),
              ),
            ),
            const SizedBox(height: 30),
            
            // معلومات إضافية
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'معلومات مهمة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('• ساعات العمل: من 8 صباحاً إلى 6 مساءً'),
                  Text('• يرجى تحضير المواد وفقاً للإرشادات'),
                  Text('• سيتم التواصل معك قبل الوصول بـ 30 دقيقة'),
                ],
              ),
            ),
            
            const Spacer(),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage2(
                        selectedMaterials: widget.selectedMaterials,
                        selectedDate: selectedDate,
                        selectedTime: selectedTime,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'التالي',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// تحديث صفحة إدخال العنوان
class ThirdPage2 extends StatefulWidget {
  final List<String> selectedMaterials;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  
  const ThirdPage2({
    super.key,
    required this.selectedMaterials,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  _ThirdPage2State createState() => _ThirdPage2State();
}

class _ThirdPage2State extends State<ThirdPage2> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalController = TextEditingController();
  final _notesController = TextEditingController();

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      // حساب النقاط المتوقعة
      int expectedPoints = widget.selectedMaterials.length * 10;
      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('تأكيد الطلب'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('تم إرسال طلب إعادة التدوير بنجاح!'),
                const SizedBox(height: 10),
                Text('المواد: ${widget.selectedMaterials.join(', ')}'),
                Text('التاريخ: ${widget.selectedDate.day}/${widget.selectedDate.month}/${widget.selectedDate.year}'),
                Text('الوقت: ${widget.selectedTime.format(context)}'),
                Text('النقاط المتوقعة: $expectedPoints نقطة'),
                const SizedBox(height: 10),
                const Text('سيتم التواصل معك قريباً لتأكيد الموعد.'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage(name: "User", initialIndex: 1)),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('موافق'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('أدخل العنوان'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ملخص الطلب
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ملخص الطلب',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text('المواد: ${widget.selectedMaterials.join(', ')}'),
                      Text('التاريخ: ${widget.selectedDate.day}/${widget.selectedDate.month}/${widget.selectedDate.year}'),
                      Text('الوقت: ${widget.selectedTime.format(context)}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              const Text(
                'أدخل عنوان الاستلام',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              
              TextFormField(
                controller: _streetController,
                decoration: const InputDecoration(
                  labelText: 'عنوان الشارع',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال عنوان الشارع';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'المدينة',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_city),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال المدينة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              
              TextFormField(
                controller: _postalController,
                decoration: const InputDecoration(
                  labelText: 'الرمز البريدي',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.markunread_mailbox),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال الرمز البريدي';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'ملاحظات إضافية (اختياري)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note),
                ),
                maxLines: 3,
              ),
              
              const Spacer(),
              
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'تأكيد الطلب',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- محتوى صفحة الإعدادات ---
class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListView(
      padding: const EdgeInsets.all(12.0),
      children: [
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(radius: 30, backgroundColor: AppColors.lightGreen, child: Icon(Icons.person, size: 30, color: Colors.white)),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('User Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('user@example.com', style: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit, color: isDark ? Colors.white70 : Colors.black54)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ValueListenableBuilder<ThemeMode>(
            valueListenable: AppTheme.themeMode,
            builder: (context, mode, _) {
              return SwitchListTile(
                title: const Text('الوضع الداكن'),
                secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                value: isDark,
                onChanged: (value) {
                  AppTheme.toggle();
                },
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              _buildSettingsTile(context, 'القوانين البيئية', Icons.gavel, const EnvironmentalLawsPage()),
              const Divider(height: 1, indent: 16, endIndent: 16),
              _buildSettingsTile(context, 'بيئة الكويت', Icons.public, const KuwaitEnvironmentPage()),
              const Divider(height: 1, indent: 16, endIndent: 16),
              _buildSettingsTile(context, 'أعمالنا', Icons.work, const OurWorkPage()),
              const Divider(height: 1, indent: 16, endIndent: 16),
              _buildSettingsTile(context, 'الأسئلة الشائعة', Icons.quiz, const FAQPage()),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              _buildSettingsTile(context, 'تواصل معنا', Icons.chat_bubble, const ChatPage()),
              const Divider(height: 1, indent: 16, endIndent: 16),
              _buildSettingsTile(context, 'تطوع معنا', Icons.volunteer_activism, VolunteerChatPage()),
              
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(BuildContext context, String title, IconData icon, Widget page) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryGreen),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

// --- صفحة الدراسات ---
class StudiesPage extends StatelessWidget {
  const StudiesPage({super.key});

  static const double _cardHeight = 150;

  static const List<Map<String, String>> _studies = [
    {
    'title': 'Environment',
    'summary': 'Impact of human activity on ecosystems and biodiversity.',
    'content':
        'The environment in Kuwait, like in many arid regions, is uniquely vulnerable to human activity and climate stressors. Over the last three decades, biodiversity loss has accelerated due to urban expansion, overgrazing, and pollution from oil industries. Studies by the Kuwait Environment Public Authority (EPA) have shown that desert ecosystems are under intense pressure, with native plant cover declining by over 40% in some regions. Biodiversity surveys indicate that several bird and reptile species face local extinction risks due to habitat fragmentation. Marine ecosystems, particularly coral reefs in the northwestern Arabian Gulf, have also experienced coral bleaching and declining fish populations linked to rising sea temperatures and pollution. This evidence underscores the need for stronger conservation strategies, integrated land-use planning, and regional cooperation to restore ecosystem balance. Current recommendations include habitat restoration, stricter enforcement of environmental laws, and greater investment in public education on sustainable practices.'
  },
  {
    'title': 'Recycling',
    'summary': 'Benefits, processes and best practices for recycling.',
    'content':
        'Recycling practices in Kuwait remain at a developing stage, despite increasing public awareness. According to a 2023 report from Kuwait Institute for Scientific Research (KISR), less than 10% of municipal solid waste is currently recycled, with the majority ending up in landfills. This is concerning, as Kuwait produces one of the highest per capita waste levels globally, averaging nearly 1.5 kg per person per day. Pilot recycling programs, such as neighborhood collection bins and educational campaigns in schools, have demonstrated significant potential: when residents are provided with clear guidelines and access to recycling infrastructure, participation rates rise to above 60%. Challenges include the lack of advanced sorting facilities, limited private sector investment, and insufficient regulations mandating recycling for businesses. To overcome these barriers, experts recommend establishing a national recycling authority, implementing extended producer responsibility policies, and creating economic incentives for companies that adopt circular economy models. If implemented effectively, Kuwait could reduce landfill dependency by over 40% within the next decade.'
  },
  {
    'title': 'Pollution',
    'summary': 'How pollution affects health, water, air, and soil.',
    'content':
        "Pollution remains one of Kuwait's most pressing environmental challenges. Air pollution levels, particularly particulate matter (PM10 and PM2.5), frequently exceed World Health Organization (WHO) safety thresholds, with desert dust storms and industrial emissions as primary contributors. A recent health study conducted in 2022 linked chronic exposure to high PM2.5 concentrations in urban Kuwait to increased cases of asthma and cardiovascular disease. Water pollution is another concern, especially in marine environments affected by oil spills, untreated wastewater discharge, and industrial effluents. Soil contamination near old oil fields, a legacy of the 1991 Gulf War oil fires, continues to affect vegetation growth and food chain safety. Recent advances in bioremediation and soil washing technologies have shown promise in restoring contaminated sites. The government, in collaboration with KISR, has launched a five-year plan to install advanced air monitoring stations, enhance wastewater treatment capacity, and rehabilitate degraded ecosystems. However, experts stress that long-term progress depends on stricter law enforcement and community engagement in reducing pollution sources."
  },
  {
    'title': 'Climate Change',
    'summary': 'Climate change trends and mitigation strategies in Kuwait.',
    'content':
        "Kuwait is highly vulnerable to climate change, with average summer temperatures already exceeding 50°C in peak months. Studies predict that by 2050, heatwaves will increase in both frequency and duration, posing significant risks to human health, energy demand, and water resources. The Intergovernmental Panel on Climate Change (IPCC) regional assessments highlight that Gulf states, including Kuwait, face extreme climate risks due to their dependency on fossil fuels and fragile ecosystems. In Kuwait, rising sea levels threaten low-lying coastal infrastructure, including oil refineries and desalination plants, which supply 90% of the country's freshwater. To address these threats, Kuwait has signed international agreements such as the Paris Accord and has committed to reducing greenhouse gas emissions by promoting renewable energy, particularly solar and wind projects. In 2023, the government announced a national renewable energy target of 15% by 2030, though implementation remains slow. Experts emphasize the importance of climate adaptation measures, such as urban greening, building cooling efficiency programs, and coastal defense systems, to ensure long-term resilience."
  },
  {
    'title': 'Waste Management',
    'summary': 'Systems for reducing and managing waste effectively.',
    'content':
        "Waste management is a critical issue for Kuwait, where annual solid waste generation exceeds 2.5 million tons. Current disposal practices rely heavily on landfilling, with limited capacity for recycling or composting. According to a 2022 KISR study, improper landfill management has led to methane emissions, groundwater contamination, and land use inefficiencies. International best practices demonstrate that integrated waste management systems—combining recycling, composting, energy recovery, and public awareness—can reduce landfill reliance by over 70%. In Kuwait, small-scale initiatives such as community recycling drives, composting programs for organic waste, and collaborations with private recycling firms have shown promise but remain insufficient at scale. Experts recommend developing waste-to-energy plants, introducing strict segregation policies, and creating financial incentives for households and businesses to reduce waste. The government's new Waste Management Strategy (2025–2035) aims to integrate smart technologies, such as IoT-based waste tracking and AI-powered sorting, to modernize Kuwait's waste infrastructure and align with global sustainability goals."
  },
  {
    'title': 'Water Resources',
    'summary': 'Freshwater scarcity and desalination challenges in Kuwait.',
    'content':
        "Kuwait is one of the most water-scarce countries in the world, with no permanent rivers or lakes. The country relies almost entirely on seawater desalination, which currently supplies over 90% of its potable water. While effective, desalination is energy-intensive and contributes to marine pollution through brine discharge. According to a 2021 World Bank study, Kuwait faces a rising water demand of nearly 5% annually due to population growth and industrial expansion. Overexploitation of underground aquifers has led to salinization and reduced availability of natural freshwater reserves. Recent innovations include the development of solar-powered desalination plants, which could reduce dependency on fossil fuels while lowering greenhouse gas emissions. However, large-scale deployment remains limited. To secure long-term water sustainability, Kuwait's Ministry of Electricity and Water is exploring integrated water resource management strategies, including wastewater recycling, rainwater harvesting, and advanced conservation programs in agriculture and households. Public education campaigns on water conservation remain essential, as per capita consumption remains among the highest globally."
  },
  {
    'title': 'Marine Ecosystems',
    'summary': 'Status of marine biodiversity and conservation efforts.',
    'content':
        "Kuwait's marine ecosystems are vital to food security, cultural heritage, and biodiversity. The northern Arabian Gulf hosts seagrass beds, mangroves, and coral reefs that support diverse fish and bird populations. However, marine environments face increasing stress from oil pollution, overfishing, and climate-induced coral bleaching. A 2022 EPA study reported that fish populations have declined by nearly 30% compared to 1990s levels, largely due to overexploitation and habitat loss. Coral reefs near Kubbar and Qaruh islands show alarming rates of bleaching linked to rising sea surface temperatures, while plastic pollution is becoming a widespread issue along Kuwait's coasts. Conservation responses include the designation of marine protected areas, restoration of mangroves, and stricter enforcement of fishing regulations. Collaborative projects with regional Gulf countries aim to improve marine biodiversity monitoring and develop joint strategies for pollution control. Experts emphasize that engaging local fishing communities in conservation programs is essential to ensure compliance and long-term sustainability."
  },
  {
    'title': 'Energy Transition',
    'summary': 'Shift from fossil fuels to renewable energy in Kuwait.',
    'content':
        "Kuwait's economy remains heavily dependent on oil exports, which account for nearly 90% of government revenue. However, the transition to renewable energy has become a pressing priority in response to global climate commitments and domestic energy demands. In 2022, Kuwait launched the Shagaya Renewable Energy Park, which includes solar and wind power projects with a combined capacity of 70 MW. While significant, this remains less than 2% of total national electricity production. Studies suggest that Kuwait has vast potential for solar energy, with over 300 days of sunshine annually. Obstacles include limited policy frameworks, high initial investment costs, and lack of specialized workforce training in renewable energy technologies. Experts recommend establishing feed-in tariffs, encouraging private sector participation, and fostering research partnerships with international renewable energy leaders. If Kuwait achieves its target of 15% renewable energy by 2030, it could significantly reduce greenhouse gas emissions, diversify its economy, and enhance energy security for future generations."
  },
  {
    'title': 'Sustainable Urban Development',
    'summary': 'Urban planning and green building initiatives in Kuwait.',
    'content':
        "Urban development in Kuwait has expanded rapidly over the past four decades, driven by population growth and economic development. However, much of this expansion has prioritized car-centric infrastructure and high-energy consumption buildings, contributing to traffic congestion, pollution, and heat island effects. A 2023 study by Kuwait University's Faculty of Architecture highlighted that nearly 70% of urban heat increases in Kuwait City are linked to poorly designed infrastructure and limited green spaces. Recent government initiatives aim to promote sustainable urban design through green building codes, energy-efficient housing, and expanded public transport systems. Smart city projects, such as South Saad Al-Abdullah, incorporate renewable energy, smart grids, and environmentally friendly transportation. Urban greening projects, including planting native desert trees and rooftop gardens, are being piloted to reduce heat stress and improve air quality. For long-term resilience, experts stress the need for integrating sustainability into every stage of urban planning and engaging citizens in co-creating livable, climate-resilient cities."
  },
  {
    'title': 'Public Health and Environment',
    'summary': 'The intersection of health outcomes and environmental quality.',
    'content':
        "Public health in Kuwait is closely linked to environmental quality, with rising pollution and climate stressors directly affecting population well-being. A 2022 study published in the Gulf Journal of Public Health found that respiratory illnesses, particularly asthma, are significantly more prevalent in urban Kuwait compared to rural areas, due to higher air pollution exposure. Cardiovascular disease risks are also linked to long-term exposure to high particulate matter levels. Heatwaves associated with climate change pose additional risks, especially for vulnerable populations such as children, the elderly, and outdoor workers. Waterborne diseases are an emerging concern in coastal areas affected by untreated wastewater discharge. In response, Kuwait's Ministry of Health has partnered with the EPA and KISR to launch integrated health-environment monitoring systems. These systems collect real-time data on air, water, and soil quality, linking them with hospital admission rates to better predict and prevent health crises. Public campaigns emphasizing healthy lifestyles, reduced exposure to pollution, and community resilience are also critical. Experts stress that addressing environmental determinants of health is not only a sustainability issue but also a national healthcare priority."
  }

  ];

  static const List<String> _studyImages = [
    
    'assets/pexels-mali-142497.jpg'
    'assets/pexels-mattycphoto-580900.jpg'
    'assets/pexels-obviouslyarthur-1296265.jpg'
    'assets/pexels-packermann-1666021.jpg'
    'assets/pexels-pixabay-459225.jpg'
    'assets/pexels-scottwebb-1048033.jpg'
    'assets/pexels-sohi-807598.jpg'
   'assets/pexels-umkreisel-app-957024.jpg'  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('Studies'),
      backgroundColor: AppColors.backgroundGreen.withOpacity(0.03),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: _studies.length,
        itemBuilder: (context, index) {
          final study = _studies[index];
          final imageUrl = _studyImages[index % _studyImages.length];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 3,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => StudyDetailPage(
                    title: study['title']!,
                    content: study['content']!,
                    imageUrl: imageUrl,
                  ),
                ));
              },
              child: Container(
                height: _cardHeight,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryGreen.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.menu_book, color: AppColors.primaryGreen, size: 32),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            study['title']!,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            study['summary']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- صفحة تفاصيل الدراسة ---
class StudyDetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;

  const StudyDetailPage({
    super.key,
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage(title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.image, size: 50, color: AppColors.primaryGreen),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

// --- صفحة الأسئلة الشائعة ---
class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  static const List<Map<String, dynamic>> faqs = [
{
  'icon': Icons.info,
  'question': 'ما هي مهمة الشركة؟',
  'answer': 'مهمتنا هي حماية البيئة وتعزيز الاستدامة من خلال برامج إعادة التدوير والتوعية البيئية، بهدف بناء مجتمع أكثر وعياً بأهمية الحفاظ على كوكبنا للأجيال القادمة.',
},
{
  'icon': Icons.volunteer_activism,
  'question': 'كيف يمكنني التطوع مع الشركة؟',
  'answer': 'يمكنك التطوع معنا من خلال التقديم عبر صفحة "التطوع" في التطبيق، حيث ستجد فرص تطوعية متنوعة مثل حملات التنظيف وورش التوعية البيئية.',
},
{
  'icon': Icons.eco,
  'question': 'ما هي الأنشطة البيئية التي تقوم بها الشركة؟',
  'answer': 'نقوم بأنشطة متنوعة تشمل برامج إعادة التدوير، حملات تنظيف الشواطئ والمناطق العامة، مشاريع التشجير، وورش التوعية البيئية في المدارس والجامعات.',
},
{
  'icon': Icons.favorite,
  'question': 'كيف يمكنني دعم أنشطة الشركة؟',
  'answer': 'يمكن دعم أنشطة الشركة من خلال التبرعات التي تساهم في استدامة برامجنا. نحن نعمل على بناء شراكات مع الجهات الحكومية والخاصة لتعزيز جهودنا وضمان استدامة برامجنا البيئية والإنسانية.',
},
{
  'icon': Icons.school,
  'question': 'كيف تعزز الشركة الوعي البيئي بين أفراد المجتمع؟',
  'answer': 'نسعى لتعزيز الوعي البيئي من خلال ورش العمل التعليمية وحملات التوعية، بالإضافة إلى المحتوى التثقيفي الذي نقدمه عبر التطبيق ووسائل التواصل الاجتماعي.',
},
{
  'icon': Icons.recycling,
  'question': 'هل تقدمون خدمة إعادة تدوير للمنازل؟',
  'answer': 'نعم، يمكنك طلب خدمة إعادة التدوير مباشرة من خلال قسم "Recycle" في التطبيق، حيث يمكنك تحديد نوع المواد وتحديد موعد لاستلامها.',
},
{
  'icon': Icons.local_shipping,
  'question': 'كيف يتم جمع المواد المعاد تدويرها؟',
  'answer': 'فريقنا يتوجه إلى الموقع المحدد من قبل المستخدم في الوقت المناسب لجمع المواد وفرزها في مراكز متخصصة لإعادة التدوير.',
},
{
  'icon': Icons.eco,
  'question': 'هل تشارك الشركة في مشاريع زراعة الأشجار؟',
  'answer': 'نعم، لدينا مبادرات تشجير دورية في مختلف المناطق، تهدف إلى زيادة المساحات الخضراء ومكافحة التصحر.',
},
{
  'icon': Icons.water,
  'question': 'هل لديكم مبادرات للحفاظ على المياه؟',
  'answer': 'نعمل على نشر الوعي باستخدام المياه بشكل مسؤول، وننفذ حملات لترشيد الاستهلاك في المدارس والمنازل.',
},
{
  'icon': Icons.lightbulb,
  'question': 'كيف يمكنني تقليل استهلاكي للطاقة؟',
  'answer': 'نوصي باستخدام الأجهزة الموفرة للطاقة، وإطفاء الأنوار عند عدم الحاجة، والاستفادة من الطاقة الشمسية متى ما كان ذلك ممكنًا.',
},
{
  'icon': Icons.support,
  'question': 'هل تقدم الشركة فرص تدريب للطلاب؟',
  'answer': 'نعم، نوفر برامج تدريبية وتطوعية للطلاب الراغبين في اكتساب خبرة عملية في مجال البيئة والاستدامة.',
},
{
  'icon': Icons.public,
  'question': 'هل تتعاونون مع جهات دولية؟',
  'answer': 'لدينا شراكات مع منظمات دولية مهتمة بالبيئة، ونعمل معًا على مشاريع مشتركة تعزز الاستدامة على مستوى عالمي.',
},
{
  'icon': Icons.store,
  'question': 'هل يمكن للشركات التعاون معكم؟',
  'answer': 'نعم، نشجع الشركات على المشاركة في برامج المسؤولية المجتمعية والتعاون معنا في حملات بيئية مشتركة.',
},
{
  'icon': Icons.medical_services,
  'question': 'هل تهتمون بالصحة العامة ضمن أنشطتكم؟',
  'answer': 'بالتأكيد، نعمل على مبادرات تقلل من التلوث وتساهم في تحسين جودة الهواء والماء، مما ينعكس على صحة الأفراد.',
},
{
  'icon': Icons.pets,
  'question': 'ما هي جهودكم لحماية الحيوانات؟',
  'answer': 'نسعى لحماية الحياة البرية والبحرية من خلال برامج مراقبة بيئية وحملات توعية، بالإضافة إلى رعاية الحيوانات الضالة.',
},
{
  'icon': Icons.group,
  'question': 'هل يمكنني اقتراح مبادرات بيئية جديدة؟',
  'answer': 'نرحب بجميع الاقتراحات، يمكنك إرسال فكرتك عبر التطبيق أو التواصل معنا مباشرة، وسندرس إمكانية تنفيذها.',
},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('الأسئلة الشائعة'),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 2,
            child: ExpansionTile(
              leading: Icon(faq['icon'], color: AppColors.primaryGreen),
              title: Text(
                faq['question'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    faq['answer'],
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- صفحة القوانين البيئية ---
class EnvironmentalLawsPage extends StatelessWidget {
  const EnvironmentalLawsPage({super.key});

  static const List<Map<String, String>> laws = [
    {
    'title': 'قانون حماية البيئة رقم 42 لسنة 2014',
    'summary': 'يشمل العديد من الأحكام المتعلقة بحماية البيئة، بما في ذلك إنشاء شرطة بيئية ومراقبين بيئيين في المؤسسات العامة.'
  },
  {
    'title': 'قانون منع تلويث المياه رقم 12 لسنة 1964',
    'summary': 'يهدف إلى حماية المياه من التلوث بالزيت والمواد الضارة الأخرى.'
  },
  {
    'title': 'قانون المحافظة على مصادر الثروة البترولية رقم 19 لسنة 1973',
    'summary': 'يهدف إلى حماية الموارد البترولية من الاستنزاف والتلوث.'
  },
  {
    'title': 'قانون تنظيم استخدام الأشعة المؤينة رقم 131 لسنة 1977',
    'summary': 'يهدف إلى الوقاية من مخاطر الإشعاع على الإنسان والبيئة.'
  },
  {
    'title': 'قانون حظر الأفعال المضرة بالنظافة العامة والمزروعات رقم 9 لسنة 1987',
    'summary': 'يهدف إلى حماية المزروعات والحفاظ على النظافة العامة.'
  },
  {
    'title': 'قانون مكافحة التدخين رقم 15 لسنة 1995',
    'summary': 'يهدف إلى حماية الصحة العامة من أضرار التدخين.'
  },
  {
    'title': 'قانون إنشاء الهيئة العامة للبيئة رقم 21 لسنة 1995',
    'summary': 'ينظم إدارة الشؤون البيئية في الكويت.'
  },
  {
    'title': 'قانون بلدية الكويت رقم 5 لسنة 2005',
    'summary': 'يتعلق بحماية البيئة والنظافة العامة في الكويت.'
  },
  {
    'title': 'قانون العمل في القطاع الأهلي رقم 6 لسنة 2010',
    'summary': 'يتضمن أحكامًا لحماية البيئة في أماكن العمل.'
  },
  {
    'title': 'قانون حماية البيئة المعدل رقم 99 لسنة 2015',
    'summary': 'تعديلات لتعزيز الحماية البيئية في الكويت.'
  },
  {
    'title': 'قانون الثروة السمكية رقم 46 لسنة 1980',
    'summary': 'ينظم استغلال وحماية الثروة السمكية في المياه الكويتية.'
  },
  {
    'title': 'قانون المحميات الطبيعية رقم 40 لسنة 1983',
    'summary': 'يهدف إلى إنشاء وحماية المحميات الطبيعية والتنوع البيولوجي.'
  },
  {
    'title': 'قانون حماية الحياة الفطرية رقم 62 لسنة 2002',
    'summary': 'يهدف إلى حماية الكائنات الفطرية وتنظيم الصيد.'
  },
  {
    'title': 'قانون الصحة العامة رقم 34 لسنة 2015',
    'summary': 'يتضمن لوائح تخص حماية الصحة والبيئة.'
  },
  {
    'title': 'قانون حماية مصادر مياه الشرب رقم 8 لسنة 1963',
    'summary': 'يحظر تلويث مصادر مياه الشرب أو الإضرار بها.'
  },
  {
    'title': 'قانون تنظيم المخلفات الصناعية رقم 20 لسنة 1995',
    'summary': 'ينظم التخلص من النفايات الصناعية بطريقة صديقة للبيئة.'
  },
  {
    'title': 'قانون النفايات الخطرة رقم 16 لسنة 1996',
    'summary': 'يعالج مسألة إدارة النفايات الخطرة ومنع تسربها.'
  },
  {
    'title': 'قانون تنظيم الرعي رقم 65 لسنة 1985',
    'summary': 'يهدف إلى حماية المراعي من الاستنزاف والحفاظ على الغطاء النباتي.'
  },
  {
    'title': 'قانون تنظيم استخدام المواد الكيميائية رقم 30 لسنة 2001',
    'summary': 'ينظم استيراد وتخزين واستخدام المواد الكيميائية لحماية البيئة.'
  },
  {
    'title': 'قانون مكافحة تلوث الهواء رقم 18 لسنة 1999',
    'summary': 'يهدف إلى تقليل انبعاثات الملوثات الهوائية وحماية جودة الهواء.'
  },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('القوانين البيئية'),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: laws.length,
        itemBuilder: (context, index) {
          final law = laws[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 2,
            child: ExpansionTile(
              leading: const Icon(Icons.gavel, color: AppColors.primaryGreen),
              title: Text(law['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    law['summary']!,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- صفحة البيئة الكويتية ---
class KuwaitEnvironmentPage extends StatelessWidget {
  const KuwaitEnvironmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('البيئة الكويتية'),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'البيئة الكويتية',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'كويت بلد صحراوي يواجه تحديات بيئية ملحة: عدم وجود أنهار أو مصدر مياه طبيعي، الاعتماد شبه الكامل على التحلية، ارتفاع درجات الحرارة القصوى، وتضرر المواطن الطبيعية بسبب التوسع العمراني والتصحر. هناك تلوث بحري متكرر، خصوصاً من آثار الانسكابات النفطية القديمة (مثل حرب 1991) بالإضافة إلى تلوث البلاستيك والفضلات البحرية، ونفايات صلبة منزلية صناعية مركزة تحتاج إدارة فعالة. دراسات حديثة (2024–2025) تبرز تلك المشاكل بدقة: موجات حر أشد وأكثر تكرارًا، محتوى عالي من البلاستيك والعضوي في النفايات، وتدهور في جودة المياه بسبب التصريفات الملوثة.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              'أحدث مرجع شامل هو تقرير 2024 لحالة البيئة في الكويت (EPA + UNEP)، يغطي جودة الهواء والمياه، التنوع الحيوي، النفايات، والسياسات البيئية. بالإضافة إلى ذلك، تظهر دراسات علمية منشورة عام 2024–2025 تفاصيل تركيب النفايات البلدية وخيارات تحسين الفرز وإعادة التدوير، وكذلك تقييمات لتأثير تحلية المياه وإدارة "البرين" الناتج على المدى البيئي. توجد أيضاً تقارير من IUCN وCBD توضح أن مساحة المحميات الطبيعية في الكويت لا تتعدى حوالي 2% من الأرض الكلية، مع توصيات بزيادة المساحات المحمية واستعادة المواطن. الإجراءات الحكومية حالياً قائمة على قوانين متعددة (مثل قانون حماية البيئة 42/2014)، لكن الغطاء التشريعي والتنفيذي يحتاج تنسيق أفضل وتكامل بين الهيئات المختلفة لضمان تنفيذ فعلي.',
              style: TextStyle(fontSize: 16,height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              'رغم صعوبة التحديات البيئية في الكويت، إلا أن هناك فرصًا واعدة للتغيير. الجهود الحالية تتجه نحو التحول إلى الطاقة المتجددة مثل مشاريع الطاقة الشمسية والرياح لتقليل الاعتماد على النفط وتخفيف الانبعاثات. كما أن إدارة النفايات تمثل مجالًا مهمًا، خصوصًا مع دراسات حديثة تؤكد أن نسبة كبيرة من النفايات يمكن إعادة تدويرها لو تم تحسين البنية التحتية والتشريعات. من جانب آخر، بدأت تظهر مبادرات شبابية وجامعية لتبني تقنيات الزراعة الذكية لمواجهة التصحر وتحسين الأمن الغذائي المحلي. هذه المسارات لا توفر فقط حلولًا بيئية، بل تفتح كذلك أبوابًا للأبحاث والابتكار، ما يجعل البيئة الكويتية مساحة خصبة للتطوير إذا تضافرت جهود الدولة مع المجتمع والقطاع الأكاديمي.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

// --- صفحة أعمالنا ---
class OurWorkPage extends StatelessWidget {
  const OurWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('أعمالنا'),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أعمالنا',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
               'نحن نعمل على حماية البيئة من خلال مجموعة متنوعة من المبادرات والبرامج التي تهدف إلى تعزيز الوعي البيئي وتشجيع الممارسات المستدامة. وتشمل جهودنا تنفيذ برامج لإعادة التدوير موجهة للأسر والشركات، بالإضافة إلى تنظيم حملات تنظيف للشواطئ والمناطق العامة للحفاظ على جمال الطبيعة ونقاوتها.',
     style: TextStyle(fontSize: 16,),
            ),
            SizedBox(height: 20),
            Text(
         'كما نولي اهتماماً خاصاً بالتثقيف من خلال ورش توعية بيئية موجهة للمدارس والجامعات، إلى جانب مشاريع التشجير وزراعة الأشجار التي تسهم في تحسين جودة الهواء والحد من التصحر. ونعمل أيضاً على تنفيذ برامج لحماية الحياة البحرية بما يضمن استدامة التنوع البيئي للأجيال القادمة.',
              style: TextStyle(fontSize: 16, ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- صفحة المحادثة ---
class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.text, required this.isUser, required this.timestamp});
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _messages.insert(0, Message(
      text: 'أهلاً بك! أنا مساعدك البيئي. كيف يمكنني خدمتك اليوم؟',
      isUser: false,
      timestamp: DateTime.now()
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _controller.text;
    if (text.isEmpty) return;

    final userMessage = Message(text: text, timestamp: DateTime.now(), isUser: true);

    setState(() {
      _messages.insert(0, userMessage);
    });
    _controller.clear();

    Future.delayed(const Duration(milliseconds: 1200), () {
      final botResponse = _getBotResponse(text);
      final botMessage = Message(text: botResponse, timestamp: DateTime.now(), isUser: false);
      if (mounted) {
        setState(() {
          _messages.insert(0, botMessage);
        });
      }
    });
  }

  String _getBotResponse(String userMessage) {
    final lowerCaseMessage = userMessage.toLowerCase();
    if (lowerCaseMessage.contains('مرحبا') || lowerCaseMessage.contains('أهلا')) {
      return 'أهلاً بك! كيف يمكنني مساعدتك اليوم في الحفاظ على البيئة؟';
    } else if (lowerCaseMessage.contains('إعادة تدوير') || lowerCaseMessage.contains('تدوير')) {
      return 'إعادة التدوير مهمة جدًا! يمكنك طلب خدمة إعادة التدوير من صفحة "Recycle" في التطبيق.';
    } else if (lowerCaseMessage.contains('تطوع')) {
      return 'رائع! يمكنك الاطلاع على فرص التطوع المتاحة والتقديم من خلال صفحة "Volunteer with Us" في الإعدادات.';
    } else if (lowerCaseMessage.contains('قوانين')) {
      return 'يمكنك الاطلاع على القوانين البيئية الكويتية من خلال صفحة "Kuwaiti Environmental Laws" في الإعدادات.';
    } else if (lowerCaseMessage.contains('شكرا')) {
      return 'على الرحب والسعة! أنا هنا للمساعدة في أي وقت.';
    } else {
      return 'لم أفهم سؤالك. يمكنك سؤالي عن "إعادة التدوير"، "التطوع"، أو "القوانين البيئية".';
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    return "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final userBubbleColor = AppColors.primaryGreen;
    final botBubbleColor = isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100;
    final sendButtonColor = AppColors.primaryGreen;

    return Scaffold(
      appBar: appBarWithImage('دردشة'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message.isUser;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!isUser)
                        Container(
                          margin: const EdgeInsets.only(right: 8.0, bottom: 4.0),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.lightGreen,
                            child: const Icon(Icons.eco, color: Colors.white, size: 18),
                          ),
                        ),
                      Flexible(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: isUser ? userBubbleColor : botBubbleColor,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(18),
                              topRight: const Radius.circular(18),
                              bottomLeft: Radius.circular(isUser ? 18 : 4),
                              bottomRight: Radius.circular(isUser ? 4 : 18),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.text,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: isUser ? Colors.white : null,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _formatTimestamp(message.timestamp),
                                style: TextStyle(
                                  fontSize: 11.0,
                                  color: isUser ? Colors.white70 : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isUser)
                        Container(
                          margin: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.blue.shade400,
                            child: const Icon(Icons.person, color: Colors.white, size: 18),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -2),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'اكتب رسالة...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        onSubmitted: (_) => _handleSend(),
                        maxLines: null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: sendButtonColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: sendButtonColor.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white, size: 20),
                      onPressed: _handleSend,
                      padding: const EdgeInsets.all(12),
                    ),
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
class VolunteerChatPage extends StatelessWidget {
  const VolunteerChatPage({super.key}); 
  
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: appBarWithImage('Volunteer with Us'),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titles[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(color: Colors.black54, blurRadius: 6),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return const VolunteerFormSheet();
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('تطوع الآن'),
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
// --- صفحة الشكر ---
class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithImage('شكراً لك'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, color: AppColors.primaryGreen, size: 100),
            const SizedBox(height: 20),
            const Text(
              'شكراً لتطوعك معنا!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'سنتواصل معك قريباً.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // العودة إلى الصفحة الرئيسية
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('العودة للرئيسية'),
            ),
          ],
        ),
      ),
    );
  }
}
// --- واجهة نموذج التطوع المنبثقة ---
class VolunteerFormSheet extends StatefulWidget {
  const VolunteerFormSheet({super.key});

  @override
  _VolunteerFormSheetState createState() => _VolunteerFormSheetState();
}

class _VolunteerFormSheetState extends State<VolunteerFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // إغلاق النافذة المنبثقة
      Navigator.of(context).pop(); 
      // الانتقال إلى صفحة الشكر
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ThankYouPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // إضافة Padding لتجنب تداخل الواجهة مع لوحة المفاتيح
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min, // لجعل العمود يأخذ أقل مساحة ممكنة
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'سجل للتطوع',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'الاسم الكامل',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال الاسم';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'رقم الهاتف',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال رقم الهاتف';
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                ),
                child: const Text('إرسال', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
