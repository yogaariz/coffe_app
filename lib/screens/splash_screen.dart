import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF3D1A00),
                  Color(0xFF6B3000),
                  Color(0xFF8B4513),
                ],
              ),
            ),
          ),
          // Coffee splash visual (abstract circles)
          Positioned(
            top: -30,
            right: -30,
            child: _buildSplashCircle(180, Colors.white.withOpacity(0.03)),
          ),
          Positioned(
            top: 60,
            left: -60,
            child: _buildSplashCircle(140, Colors.white.withOpacity(0.04)),
          ),
          // Main coffee cup illustration
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Center(
                child: _buildCoffeeCupIllustration(),
              ),
            ),
          ),
          // Bottom content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(28, 40, 28, 56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Time for a\ncoffee break....',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Your daily dose of fresh brew delivered to\nyour doorstep. Start your coffee journey now!',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 36),
                      // Page indicator
                      Row(
                        children: [
                          _buildDot(false),
                          const SizedBox(width: 6),
                          _buildDot(false),
                          const SizedBox(width: 6),
                          _buildDot(true),
                        ],
                      ),
                      const SizedBox(height: 28),
                      // Get Started button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD97B29),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeCupIllustration() {
    return Container(
      width: 280,
      height: 320,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Glow effect
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD97B29).withOpacity(0.3),
                  blurRadius: 80,
                  spreadRadius: 20,
                ),
              ],
            ),
          ),
          // Ice cubes floating
          Positioned(
            top: 20,
            left: 30,
            child: Transform.rotate(
              angle: -0.5,
              child: _buildIceCube(40),
            ),
          ),
          Positioned(
            top: 10,
            right: 40,
            child: Transform.rotate(
              angle: 0.3,
              child: _buildIceCube(30),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Transform.rotate(
              angle: -0.8,
              child: _buildIceCube(25),
            ),
          ),
          // Coffee splash ring
          Positioned(
            top: 80,
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: const Color(0xFFD2954E).withOpacity(0.4),
                  width: 2,
                ),
              ),
            ),
          ),
          // Main cup
          Positioned(
            bottom: 20,
            child: _buildCoffeeCup(),
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeCup() {
    return Container(
      width: 160,
      height: 190,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Cup body
          Positioned(
            bottom: 0,
            child: Container(
              width: 130,
              height: 160,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF8B4513),
                    Color(0xFF5C2C00),
                    Color(0xFF3D1A00),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
            ),
          ),
          // Coffee liquid
          Positioned(
            top: 20,
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                gradient: const RadialGradient(
                  colors: [
                    Color(0xFFD2954E),
                    Color(0xFF8B5A1A),
                  ],
                ),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
          // Handle
          Positioned(
            right: 0,
            child: Container(
              width: 30,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF6B3000),
                  width: 8,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          // Highlight
          Positioned(
            left: 20,
            top: 30,
            child: Container(
              width: 8,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIceCube(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.6),
            Colors.white.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 1,
        ),
      ),
    );
  }

  Widget _buildSplashCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFD97B29)
            : Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
