import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:islam/models/ByMonthResponse.dart';

import '../bloc/data_bloc.dart';
import '../models/PraysTimeModel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final time = DateTime.now();
  int nextPrayIndex = -1;
  late Duration duration;
  List<ByMonthResponse> currentMonth = [];
  List<PrayTime> today = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tashkent',
              style: TextStyle(fontSize: 24, fontFamily: 'WinterStorm'),
            ),
            Text(
              'Sunday, February 18',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'WinterStorm',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataLoaded) {
            currentMonth = state.data;
            loadData();

            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40),
              child: Column(
                children: [
                  Container(
                    height: 122,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Color(int.parse('0xFFBBBBBB'))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${today[nextPrayIndex].name} in",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                              TimerCountdown(
                                endTime: DateTime.now().add(duration),
                                enableDescriptions: false,
                                timeTextStyle: const TextStyle(fontSize: 24),
                                format:
                                    CountDownTimerFormat.hoursMinutesSeconds,
                                onEnd: () {
                                  setState(() {
                                    loadData();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 52,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(int.parse(
                                    index == nextPrayIndex - 1
                                        ? '0xFFBBBBBB'
                                        : '0xFFE5E5E5'))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(today[index].name),
                                  const Spacer(),
                                  Text(today[index].time)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20)
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void loadData() {
    int currentHour = time.hour;
    int currentMinute = time.minute;
    String bomdod = currentMonth[time.day - 1].times.tongSaharlik;
    List<String> bomdodParts = bomdod.split(':');
    int bomdodHour = int.parse(bomdodParts[0]);
    int bomdodMinute = int.parse(bomdodParts[1]);
    String quyosh = currentMonth[time.day - 1].times.quyosh;
    List<String> quyoshParts = quyosh.split(':');
    int quyoshHour = int.parse(quyoshParts[0]);
    int quyoshMinute = int.parse(quyoshParts[1]);
    String peshin = currentMonth[time.day - 1].times.peshin;
    List<String> peshinParts = peshin.split(':');
    int peshinHour = int.parse(peshinParts[0]);
    int peshinMinute = int.parse(peshinParts[1]);
    String asr = currentMonth[time.day - 1].times.asr;
    List<String> asrParts = asr.split(':');
    int asrHour = int.parse(asrParts[0]);
    int asrMinute = int.parse(asrParts[1]);
    String shom = currentMonth[time.day - 1].times.shomIftor;
    List<String> shomParts = shom.split(':');
    int shomHour = int.parse(shomParts[0]);
    int shomMinute = int.parse(shomParts[1]);
    String hufton = currentMonth[time.day - 1].times.hufton;
    List<String> huftonParts = hufton.split(':');
    int huftonHour = int.parse(huftonParts[0]);
    int huftonMinute = int.parse(huftonParts[1]);
    String nextDayBomdod = currentMonth[time.day].times.tongSaharlik;
    List<String> nextDayBomdodParts = nextDayBomdod.split(':');
    int nextBomdodHour = int.parse(nextDayBomdodParts[0]);
    int nextBomdodMinute = int.parse(nextDayBomdodParts[1]);
    today.add(PrayTime(
        hour: bomdodHour, minute: bomdodMinute, name: "Bomdod", time: bomdod));
    today.add(PrayTime(
        hour: quyoshHour, minute: quyoshMinute, name: "Quyosh", time: quyosh));
    today.add(PrayTime(
        hour: peshinHour, minute: peshinMinute, name: "Peshin", time: peshin));
    today.add(
        PrayTime(hour: asrHour, minute: asrMinute, name: "Asr", time: asr));
    today.add(
        PrayTime(hour: shomHour, minute: shomMinute, name: "Shom", time: shom));
    today.add(PrayTime(
        hour: huftonHour, minute: huftonMinute, name: "Hufton", time: hufton));
    today.add(PrayTime(
        hour: nextBomdodHour,
        minute: nextBomdodMinute,
        name: "Bomdod",
        time: nextDayBomdod));
    for (int i = 0; i < today.length; i++) {
      if (currentHour < today[i].hour ||
          currentHour == today[i].hour && currentMinute < today[i].minute) {
        nextPrayIndex = i;

        break;
      }
      if (i == today.length - 1) {
        nextPrayIndex = i;
        break;
      }
    }

    duration = Duration(
            hours: today[nextPrayIndex].hour,
            minutes: today[nextPrayIndex].minute) -
        Duration(hours: currentHour, minutes: currentMinute);
    if (nextPrayIndex == today.length - 1) {
      if (currentHour < 6) {
        duration = Duration(
                hours: today[nextPrayIndex].hour,
                minutes: today[nextPrayIndex].minute) -
            Duration(hours: currentHour, minutes: currentMinute);
      } else {
        duration = Duration(
                hours: today[nextPrayIndex].hour,
                minutes: today[nextPrayIndex].minute,
                days: 1) -
            Duration(hours: currentHour, minutes: currentMinute);
      }
    }
  }
}
