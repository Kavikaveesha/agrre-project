import 'package:flutter/material.dart';


class AboutUsDetails extends StatefulWidget {
  const AboutUsDetails({super.key});

  @override
  State<AboutUsDetails> createState() => _AboutUsDetailsState();
}

class _AboutUsDetailsState extends State<AboutUsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38.0, left: 15.0, right: 15.0),
                child: Container(
                  child: const Center(
                    child: Column(
                      children: [
                        Text(
                          "Paragraphs Pack contains a number of Paragraph bundles "
                              "to help you get up and running very quickly. Classy "
                              "Paragraphs is a Drupal module which gives your Paragraphs"
                              " a little class. Content creators can easily assign a class "
                              "to a paragraph to style it according to a controlled list "
                              "which was defined by the site builder. Edgy is a Drupal "
                              "module which provides a couple of templates for Panels and "
                              "Display Suite to give your designs that edgy look. "
                              "Views Filter Object is a Drupal module which allows "
                              "content creators to configure a view via the standard "
                              "editing interface for any entity. It works particularly "
                              "well with Paragraphs.",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'EcoOffical@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

