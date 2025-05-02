import 'package:flutter/material.dart';
import 'package:student/models/student_model.dart';
import 'package:student/services/database_helper.dart';

class StudentScreen extends StatelessWidget {
  final Student? student;
  const StudentScreen({
    super.key,
    this.student
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final codeController = TextEditingController();
    final emailController = TextEditingController();

    if(student != null){
      nameController.text = student!.name;
      codeController.text = student!.code;
      emailController.text = student!.email;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text( student == null
            ? 'Add a student'
            : 'Edit student'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Center(
                child: Text(
                  'What are you thinking about?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: TextFormField(
                controller: nameController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Name',
                    labelText: 'Student Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: TextFormField(
                controller: codeController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Code',
                    labelText: 'Student Code',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: TextFormField(
                controller: emailController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Student Email',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final name = nameController.value.text;
                      final code = codeController.value.text;
                      final email = emailController.value.text;
                      if (name.isEmpty || code.isEmpty || email.isEmpty) {
                        return;
                      }

                      final Student model = Student(name: name, code: code, email: email, id: student?.id);
                      if(student == null){
                        await DatabaseHelper.addStudent(model);
                      }else{
                        await DatabaseHelper.updateStudent(model);
                      }

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                            const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 0.75,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )))),
                    child: Text( student == null
                        ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}