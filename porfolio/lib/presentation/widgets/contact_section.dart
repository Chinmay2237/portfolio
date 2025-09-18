import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';

class ContactSection extends StatelessWidget {
  // A simple data structure for contact information
  final List<Map<String, dynamic>> contactInfo = [
    {'icon': Icons.email_rounded, 'title': 'Email', 'value': 'alex.johnson@example.com'},
    {'icon': Icons.phone_rounded, 'title': 'Phone', 'value': '+1 (555) 123-4567'},
    {'icon': Icons.location_on_rounded, 'title': 'Location', 'value': 'San Francisco, CA'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Section Title
          Text(
            "Get In Touch",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 20),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 60),

          // Main Content
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 1100),
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Responsive.isDesktop(context)
                ? _buildDesktopLayout(context)
                : _buildMobileLayout(context),
          ),
        ],
      ),
    );
  }

  // Layout for desktop screens
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildContactInfo(context)),
        const SizedBox(width: 50),
        Expanded(flex: 3, child: ContactForm()),
      ],
    );
  }

  // Layout for mobile and tablet screens
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildContactInfo(context),
        const SizedBox(height: 50),
        ContactForm(),
      ],
    );
  }

  // Builds the contact information section
  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Connect",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 20),
        Text(
          "Have a project in mind or want to discuss potential opportunities? I'd love to hear from you!",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 40),
        ...contactInfo.map((info) => ContactInfoItem(info: info)).toList(),
      ],
    );
  }
}

// A single item for contact information
class ContactInfoItem extends StatelessWidget {
  final Map<String, dynamic> info;

  const ContactInfoItem({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        children: [
          Icon(info['icon'], color: Theme.of(context).colorScheme.primary, size: 30),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info['title'],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(info['value'], style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ],
      ),
    );
  }
}

// The contact form
class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name and Email fields
          Row(
            children: [
              Expanded(
                child: _buildTextFormField(
                  controller: _nameController,
                  labelText: "Your Name",
                  validator: (value) => (value == null || value.isEmpty) ? 'Please enter your name' : null,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildTextFormField(
                  controller: _emailController,
                  labelText: "Your Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your email';
                    if (!value.contains('@')) return 'Please enter a valid email';
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Message field
          _buildTextFormField(
            controller: _messageController,
            labelText: "Your Message",
            maxLines: 5,
            validator: (value) => (value == null || value.isEmpty) ? 'Please enter your message' : null,
          ),
          const SizedBox(height: 30),

          // Send Message Button
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Message sent successfully!'), backgroundColor: Colors.green),
                  );
                  _formKey.currentState!.reset();
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text("Send Message"),
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build styled text form fields
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required FormFieldValidator<String> validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      validator: validator,
    );
  }
}
