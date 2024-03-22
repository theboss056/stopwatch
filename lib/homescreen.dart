import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

class StopwatchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(swProvider);
    final elapsedTime = controller.elapsedTimeString;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(
            child: Text(
          "Stopwatch",
        )),
        backgroundColor: Colors.white12,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: CupertinoButton(
                borderRadius: BorderRadius.circular(4000),
                onPressed: () {
                  controller.handleStartStop();
                },
                //color: Colors.cyan.shade50,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 4,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            elapsedTime,
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.cyan.shade50,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black, // Text color
                              elevation: 5, // Elevation
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded corners
                              ),
                            ),
                            onPressed: () {
                              controller.handleStartStop();
                            },
                            child:
                                Text(controller.isRunning ? 'Stop' : 'Start'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // Text color
                    elevation: 5, // Elevation
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  onPressed: controller.reset,
                  child: Text('Reset'),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // Text color
                    elevation: 5, // Elevation
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  onPressed: () {
                    controller.addLap();
                  },
                  child: Text('Lap'),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: ListView.builder(
                  itemCount: controller.laps.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      textColor: Colors.cyan.shade50,
                      onTap: () {},
                      title: Center(
                        child: Text(
                          'Lap ${index + 1}: ${controller.laps[index]}',
                          style: TextStyle(fontWeight: FontWeight.bold
                              //color: Colors.cyan.shade50,
                              ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
