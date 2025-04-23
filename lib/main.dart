import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipePage(),
    );
  }
}

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  bool showIngredients = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 53, 11),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF2F430D),
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xFFD5AE7F),
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF2F430D),
                          ),
                        ),
                        Image.asset('assets/logo.png', height: 50),
                        const CircleAvatar(
                          backgroundColor: Color(0xFFD5AE7F),
                          child: Icon(Icons.bookmark, color: Color(0xFF2F430D)),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4C6329),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Grilled Chicken Salad',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/salad.png'),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD5AE7F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:
                                  () => setState(() => showIngredients = true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      showIngredients
                                          ? const Color(0xFF4C6329)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  'Ingredients',
                                  style: TextStyle(
                                    color:
                                        showIngredients
                                            ? Colors.white
                                            : Colors.brown[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap:
                                  () => setState(() => showIngredients = false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      !showIngredients
                                          ? const Color(0xFF4C6329)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  'Instructions',
                                  style: TextStyle(
                                    color:
                                        !showIngredients
                                            ? Colors.white
                                            : Colors.brown[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
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

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD5AE7F),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredients() {
    return Container(
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
          _IngredientItem(
            name: 'Grilled\nChicken',
            image: 'assets/chicken.png',
          ),
          _IngredientItem(name: 'Lemon', image: 'assets/lemon.png'),
          _IngredientItem(name: 'Eggs', image: 'assets/egg.png'),
          _IngredientItem(name: 'Lettuce', image: 'assets/lettuce.png'),
          _IngredientItem(name: 'Pepper', image: 'assets/pepper.png'),
          _IngredientItem(name: 'Olive Oil', image: 'assets/olive.png'),
        ],
      ),
    );
  }

  Widget _buildInstructions() {
    const TextStyle instructionStyle = TextStyle(
      color: Colors.black87,
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "1. In a bowl, add 2 cups chopped lettuce, 1 sliced avocado,\n½ cup cherry tomatoes, and 2 boiled eggs.",
            style: instructionStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            "2. Top with 1 grilled chicken breast (sliced).",
            style: instructionStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            "3. Drizzle with 1 tbsp olive oil and ½ tbsp lemon juice.",
            style: instructionStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            "4. Sprinkle with ¼ tsp black pepper.",
            style: instructionStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            "5. Serve fresh and enjoy!",
            style: instructionStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  final String name;
  final String image;

  const _IngredientItem({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            color: Color(0xFF2F430D),
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
