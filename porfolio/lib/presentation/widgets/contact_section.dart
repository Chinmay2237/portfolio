import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';
import 'package:porfolio/presentation/widgets/contact_form.dart';
import 'package:porfolio/presentation/widgets/fade_in_widget.dart';

import 'contact_info_item.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ContactSectionMobile(),
      tablet: ContactSectionTablet(),
      desktop: ContactSectionDesktop(),
    );
  }
}

class ContactSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
        ),
      ),
      child: Column(
        children: [
          FadeInWidget(
            child: Text(
              "Get In Touch",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF007AFF), Color(0xFF5856D6)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 60),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Have a project in mind or want to discuss potential opportunities? I'd love to hear from you!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF86868B),
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: [
                    ContactInfoItem(
                      icon: Icons.email,
                      title: "Email",
                      value: "alex.johnson@example.com",
                      onTap: () {
                        // launchUrl(Uri.parse("mailto:alex.johnson@example.com"));
                      },
                    ),
                    ContactInfoItem(
                      icon: Icons.phone,
                      title: "Phone",
                      value: "+1 (555) 123-4567",
                      onTap: () {
                        // launchUrl(Uri.parse("tel:+15551234567"));
                      },
                    ),
                    ContactInfoItem(
                      icon: Icons.location_on,
                      title: "Location",
                      value: "San Francisco, CA",
                      onTap: () {
                        // launchUrl(
                        //   Uri.parse(
                        //     "https://maps.google.com/?q=San+Francisco,+CA",
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 40),
                ContactForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSectionTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
        ),
      ),
      child: Column(
        children: [
          FadeInWidget(
            child: Text(
              "Get In Touch",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF007AFF), Color(0xFF5856D6)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 60),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 800),
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Have a project in mind or want to discuss potential opportunities? I'd love to hear from you!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF86868B),
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: [
                    ContactInfoItem(
                      icon: Icons.email,
                      title: "Email",
                      value: "alex.johnson@example.com",
                      onTap: () {
                        // launchUrl(Uri.parse("mailto:alex.johnson@example.com"));
                      },
                    ),
                    ContactInfoItem(
                      icon: Icons.phone,
                      title: "Phone",
                      value: "+1 (555) 123-4567",
                      onTap: () {
                        // launchUrl(Uri.parse("tel:+15551234567"));
                      },
                    ),
                    ContactInfoItem(
                      icon: Icons.location_on,
                      title: "Location",
                      value: "San Francisco, CA",
                      onTap: () {
                        // launchUrl(
                        //   Uri.parse(
                        //     "https://maps.google.com/?q=San+Francisco,+CA",
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 40),
                ContactForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSectionDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
        ),
      ),
      child: Column(
        children: [
          FadeInWidget(
            child: Text(
              "Get In Touch",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF007AFF), Color(0xFF5856D6)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 60),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 1000),
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's Connect",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Have a project in mind or want to discuss potential opportunities? I'd love to hear from you!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF86868B),
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 40),
                      ContactInfoItem(
                        icon: Icons.email,
                        title: "Email",
                        value: "alex.johnson@example.com",
                        onTap: () {
                          // launchUrl(Uri.parse("mailto:alex.johnson@example.com"));
                        },
                      ),
                      SizedBox(height: 20),
                      ContactInfoItem(
                        icon: Icons.phone,
                        title: "Phone",
                        value: "+1 (555) 123-4567",
                        onTap: () {
                          // launchUrl(Uri.parse("tel:+15551234567"));
                        },
                      ),
                      SizedBox(height: 20),
                      ContactInfoItem(
                        icon: Icons.location_on,
                        title: "Location",
                        value: "San Francisco, CA",
                        onTap: () {
                          // launchUrl(
                          //   Uri.parse(
                          //     "https://maps.google.com/?q=San+Francisco,+CA",
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 50),
                Expanded(
                  flex: 3,
                  child: ContactForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
