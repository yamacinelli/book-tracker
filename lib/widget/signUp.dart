import 'package:aula/dao/userDao.dart';
import 'package:aula/model/user.dart';
import 'package:aula/widget/appBar.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final controllerName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerSamePassword = TextEditingController();

  bool _disabledButton = true;

  void _validateForm() {
    if (controllerName.text.isEmpty
        || (controllerLastName.text.isEmpty
            || (controllerEmail.text.isEmpty
                || (controllerPassword.text.isEmpty
                    || (controllerSamePassword.text.isEmpty
                        || controllerPassword.text != controllerSamePassword.text))))) {
      _disabledButton = true;
    } else {
      _disabledButton = false;
    }
    setState(() {});
  }

  void submit() async {
    UserDao().save(User(name: controllerName.text, lastName: controllerLastName.text, email: controllerEmail.text, password: controllerPassword.text));
  }

  Widget _buildBody(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Criar conta',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Preencha os campos abaixo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: controllerName,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(fontSize: 13),
                  border: UnderlineInputBorder(),
                ),
                onChanged: (value) => _validateForm(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: controllerLastName,
                decoration: const InputDecoration(
                  labelText: 'Sobrenome',
                  labelStyle: TextStyle(fontSize: 13),
                  border: UnderlineInputBorder(),
                ),
                onChanged: (value) => _validateForm(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: controllerEmail,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(fontSize: 13),
                  border: UnderlineInputBorder(),
                ),
                onChanged: (value) => _validateForm(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                obscureText: true,
                controller: controllerPassword,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(fontSize: 13),
                  border: UnderlineInputBorder(),
                ),
                onChanged: (value) => _validateForm(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                obscureText: true,
                controller: controllerSamePassword,
                decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',
                  labelStyle: TextStyle(fontSize: 13),
                  border: UnderlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != controllerPassword.text) {
                    return "Senhas não são iguais";
                  }
                  return null;
                },
                onChanged: (value) => _validateForm(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () async {
                  if (_disabledButton) {
                    return;
                  } else {
                    submit();
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _disabledButton ? Colors.blueGrey : Theme.of(context).colorScheme.primary,
                  fixedSize: const Size.fromWidth(300),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Criar',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBookTracker(true, false, '', context),
      body: _buildBody(context),
    );
  }
}