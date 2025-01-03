import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/view/core/auth/login_page/widget/form_auth_signup.dart';
import 'package:wave_education/view/widgets/main_footer.dart';
import 'package:wave_education/view/widgets/main_header.dart';

class QuizPage extends StatelessWidget {
  final String? questionPathId;
  final String modulePathId;
  final String coursePathId;
  final String? nextQuestion;

  QuizPage({
    required this.coursePathId,
    required this.modulePathId,
    this.questionPathId,
    this.nextQuestion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Parse current question ID, default ke 1 jika null
    int currentQuestionId = int.tryParse(questionPathId ?? "1") ?? 1;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainHeader(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quiz Page $currentQuestionId",
                      style: GoogleFonts.poppins(
                          fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Question $currentQuestionId",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF4366DE),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                QuestionQuiz(),
                                ChoicesQuiz(),
                                ChoicesQuiz(),
                                ChoicesQuiz(),
                                ChoicesQuiz(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 6,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3))
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xFF4366DE),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        "Question",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          RemainingQuestion(),
                                          RemainingQuestion(),
                                          RemainingQuestion(),
                                          RemainingQuestion(),
                                          RemainingQuestion(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                height: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Navigasi ke pertanyaan berikutnya
                                        String nextQuestion =
                                            (currentQuestionId + 1).toString();

                                        context
                                            .goNamed("quiz", pathParameters: {
                                          "questionPathId": nextQuestion,
                                          "modulePathId": modulePathId,
                                          "coursePathId": coursePathId
                                        });
                                      },
                                      child: Text("Next"),
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        backgroundColor:
                                            const Color(0xFFDFE9FF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        shadowColor: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const MainFooter(),
          ],
        ),
      ),
    );
  }
}

class ButtonQuiz extends StatelessWidget {
  final String questionPathId;
  final String modulePathId;
  final String coursePathId;
  final String text;
  const ButtonQuiz({
    required this.questionPathId,
    required this.modulePathId,
    required this.coursePathId,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.goNamed("quiz", pathParameters: {
          "questionPathId": "${int.parse(questionPathId) + 1}",
          "modulePathId": modulePathId,
          "coursePathId": coursePathId
        });
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        backgroundColor: const Color(0xFFDFE9FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: Colors.grey,
      ),
    );
  }
}

class RemainingQuestion extends StatelessWidget {
  const RemainingQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFDFE9FF),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          "1",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class QuestionQuiz extends StatelessWidget {
  const QuestionQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      decoration: BoxDecoration(
        // elevation
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 6,
              blurRadius: 7,
              offset: const Offset(0, 3))
        ],
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFF4366DE),
      ),
      padding: const EdgeInsets.all(30),
      child: Text(
        "What is the purpose of the main method in a Java program?",
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class ChoicesQuiz extends StatelessWidget {
  const ChoicesQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          backgroundColor: const Color(0xFFDFE9FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadowColor: Colors.grey,
        ),
        onPressed: () {},
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Answer 1",
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
