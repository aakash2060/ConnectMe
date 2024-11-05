import 'package:connect_me/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'qrcode.dart';

class BusinessCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String photoUrl;
  final String organization;
  final String title;

  const BusinessCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.photoUrl,
    required this.organization,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 3, 101, 146),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: CustomPaint(
            painter: CurvePainter(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.2), // Adjust the gap at the top
                  Center(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.15,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.14,
                        backgroundImage: NetworkImage(photoUrl),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Extra space below avatar

                  // Moved the name's portion below the blue background
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person,
                                color: Colors.black, size: 24),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                name.isNotEmpty ? name : 'Your Name',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  letterSpacing: 1.15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: 20), // Increased spacing between rows
                      ],
                    ),
                  ),

                  // Other rows for email, phone, organization, title
                  Row(
                    children: [
                      const Icon(Icons.email, color: Colors.black, size: 24),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          email.isNotEmpty ? email : 'Your Email',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.black, size: 24),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          phone.isNotEmpty ? phone : 'Your Phone',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.corporate_fare,
                          color: Colors.black, size: 24),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          organization.isNotEmpty
                              ? organization
                              : 'Your Organization',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.work, color: Colors.black, size: 24),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          title.isNotEmpty ? title : 'Your Title',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Divider(
                    indent: MediaQuery.of(context).size.width * 0.1,
                    endIndent: MediaQuery.of(context).size.width * 0.1,
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                  Center(
                      child: ElevatedButton(
                    child: Text('Share Your Info'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QRCodeScreen(
                            name: name,
                            email: email,
                            phone: phone,
                            photoUrl: photoUrl,
                            organization: organization,
                            title: title,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red, elevation: 0),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.shader = const LinearGradient(
      colors: [Color.fromARGB(255, 3, 101, 146), Colors.blueAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    var path = Path();
    path.moveTo(0, size.height * 0.15);
    path.quadraticBezierTo(
        size.width * 0.48, size.height * 0.38, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
