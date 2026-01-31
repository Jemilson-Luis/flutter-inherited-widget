import 'package:flutter/material.dart';
import 'package:inherited_widget/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  void updateAuthData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 24,
                children: [
                  SizedBox(height: 48),
                  Consumer<AuthProvider>(
                    builder: (context, data, child) {
                      return Text(
                        'Olá, ${data.auth.firstName} ${data.auth.lastName}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                  _textFormField(textEditingController: _firstName),
                  _textFormField(textEditingController: _lastName),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                      ),
                      onPressed: () => context.read<AuthProvider>().updateAuth(
                        AuthModel(
                          id: "",
                          firstName: _firstName.text,
                          lastName: _lastName.text,
                        ),
                      ),
                      child: Text(
                        "Update Data",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
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
}

Widget _textFormField({value, textEditingController}) {
  return TextFormField(
    controller: textEditingController,
    decoration: InputDecoration(border: OutlineInputBorder()),
  );
}
