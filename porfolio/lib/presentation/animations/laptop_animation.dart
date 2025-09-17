import 'package:flutter/material.dart';

class LaptopAnimationSection extends StatefulWidget {
  @override
  _LaptopAnimationSectionState createState() => _LaptopAnimationSectionState();
}

class _LaptopAnimationSectionState extends State<LaptopAnimationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: isMobile ? 300 : 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF007AFF).withOpacity(0.1), Color(0xFF5856D6).withOpacity(0.1)],
        ),
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Laptop base
                    Container(
                      width: isMobile ? 250 : 400,
                      height: isMobile ? 180 : 280,
                      decoration: BoxDecoration(
                        color: Color(0xFF1D1D1F),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                    ),
                    
                    // Laptop screen
                    Positioned(
                      top: isMobile ? 20 : 30,
                      child: Container(
                        width: isMobile ? 220 : 350,
                        height: isMobile ? 140 : 220,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF007AFF), Color(0xFF5856D6)],
                          ),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(isMobile ? 8 : 12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                "Welcome to My Portfolio",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isMobile ? 12 : 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Code animation inside screen
                    Positioned(
                      top: isMobile ? 50 : 80,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: isMobile ? 180 : 280,
                        height: isMobile ? 20 : 30,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            "Building amazing Flutter apps...",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 8 : 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Keyboard
                    Positioned(
                      bottom: isMobile ? 15 : 25,
                      child: Container(
                        width: isMobile ? 200 : 320,
                        height: isMobile ? 8 : 12,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
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