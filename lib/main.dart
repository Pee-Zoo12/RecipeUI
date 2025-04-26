import 'package:flutter/material.dart';

void main() => runApp(const RecipeApp());

// App colors
const _backgroundColor = Color.fromARGB(255, 37, 53, 11);
const _headerColor = Color(0xFF2F430D);
const _logoColor = Color(0xFFD5AE7F);
const _buttonColor = Color(0xFF4C6329);
const _ingredientCardColor = Color(0xFFD5AE7F);
const _ingredientTextColor = Color(0xFF2F430D);

// Common styles
const _tabStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

const _instructionStyle = TextStyle(
  color: Colors.black87,
  fontSize: 18,
  height: 1.5,
  fontWeight: FontWeight.bold,
);

const _titleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24,
  color: Colors.brown,
);

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) =>
      MaterialApp(debugShowCheckedModeBanner: false, home: const RecipePage());
}

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  bool showIngredients = true;

  Widget _buildTopBar() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const CircleAvatar(
        backgroundColor: _logoColor,
        child: Icon(Icons.arrow_back, color: _headerColor),
      ),
      Image.asset('assets/logo.png', height: 50),
      const CircleAvatar(
        backgroundColor: _logoColor,
        child: Icon(Icons.bookmark, color: _headerColor),
      ),
    ],
  );

  Widget _buildTab(String text, bool isSelected, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? _buttonColor : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            text,
            style: _tabStyle.copyWith(
              color: isSelected ? Colors.white : Colors.brown[800],
            ),
          ),
        ),
      );

  Widget _buildIngredients() => Container(
    height: MediaQuery.of(context).size.height * 0.4,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.75,
      physics: const BouncingScrollPhysics(),
      children: const [
        _IngredientItem(name: 'Avocado', image: 'assets/avocado.png'),
        _IngredientItem(name: 'Cherry\nTomatoes', image: 'assets/tomato.png'),
        _IngredientItem(name: 'Grilled\nChicken', image: 'assets/chicken.png'),
        _IngredientItem(name: 'Lemon', image: 'assets/lemon.png'),
        _IngredientItem(name: 'Eggs', image: 'assets/egg.png'),
        _IngredientItem(name: 'Lettuce', image: 'assets/lettuce.png'),
        _IngredientItem(name: 'Pepper', image: 'assets/pepper.png'),
        _IngredientItem(name: 'Olive Oil', image: 'assets/olive.png'),
      ],
    ),
  );

  Widget _buildInstructions() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          "1. In a bowl, add 2 cups chopped lettuce, 1 sliced avocado,\n½ cup cherry tomatoes, and 2 boiled eggs.",
          style: _instructionStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Text(
          "2. Top with 1 grilled chicken breast (sliced).",
          style: _instructionStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          "3. Drizzle with 1 tbsp olive oil and ½ tbsp lemon juice.",
          style: _instructionStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          "4. Sprinkle with ¼ tsp black pepper.",
          style: _instructionStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          "5. Serve fresh and enjoy!",
          style: _instructionStyle,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Status bar
            Container(
              color: _headerColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('10:30', style: TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, color: Colors.white, size: 18),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, color: Colors.white, size: 18),
                    ],
                  ),
                ],
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildTopBar(),
                    const SizedBox(height: 20),

                    // Title
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: _buttonColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xFFD5AE7F),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Text(
                        'Grilled Chicken Salad',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/salad.png',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Content
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: _ingredientCardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildTab(
                                'Ingredients',
                                showIngredients,
                                () => setState(() => showIngredients = true),
                              ),
                              _buildTab(
                                'Instructions',
                                !showIngredients,
                                () => setState(() => showIngredients = false),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          showIngredients
                              ? _buildIngredients()
                              : _buildInstructions(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  final String name;
  final String image;

  const _IngredientItem({required this.name, required this.image});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(244, 194, 188, 188),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Image.asset(image, width: 85, height: 85, fit: BoxFit.contain),
      ),
      const SizedBox(height: 8),
      Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: _ingredientTextColor,
          height: 1.2,
        ),
      ),
    ],
  );
}
