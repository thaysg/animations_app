import 'package:animations_app/presentation/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';

import 'widgets/fortune_whell_widget.dart';
import 'widgets/text_form_field_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5C30F2),
        title: const Text('Stawti FortuneWheel'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (_controller) {
                        return TextFormFieldWidget(
                          controller: _controller.controller,
                          validator: _controller.validateString,
                          onChanged: _controller.onChangeString,
                          onTap: _controller.clearParticipants,
                        );
                      },
                    ),
                    const SizedBox(height: 24.0),
                    Expanded(
                      child: GetBuilder<HomeController>(
                        init: HomeController(),
                        builder: (_controller) {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              childAspectRatio: 2.5,
                            ),
                            itemCount: _controller.participants.length,
                            itemBuilder: (_, int idx) {
                              return Text(
                                _controller.participants[idx] + ', ',
                                maxLines: 5,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24.0),
              Expanded(
                child: GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (_controller) {
                    if (_controller.participants.isNotEmpty &&
                        _controller.participants.length > 1) {
                      return FortuneWhellWidget(
                        onAnimationEnd: () {
                          _controller.seletcStream();
                        },
                        onTap: () {
                          _controller.selectdParticpant();
                          //_controller.seletcStream();
                        },
                        onFling: () {
                          _controller.selected.add(1);
                        },
                        selected: _controller.selected.stream,
                        items: [
                          for (var it in _controller.participants)
                            FortuneItem(
                              style: FortuneItemStyle(
                                color: _controller.colors[Fortune.randomInt(
                                    0, _controller.colors.length)],
                              ),
                              child: Text(it),
                            ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_controller) {
                  if (_controller.selectedValue != null) {
                    return FutureBuilder(
                      future: Future.delayed(
                        const Duration(seconds: 4),
                        () => _controller.selectedValue,
                      ),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Text(
                            'Winner: ${_controller.participants[_controller.selectedValue!]}',
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
