import 'package:flutter/material.dart';
import 'menu.dart';
import 'package:science_lab_2/utils.dart';

class Equipment extends StatefulWidget {
  const Equipment({Key? key}) : super(key: key);

  @override
  State<Equipment> createState() => _EquipmentState();
}


class _EquipmentState extends State<Equipment> {

  //DateTime old = DateTime.now();
  DateTime old = DateTime(2022, 5, 29);//storable from prev app closing

  List<List<String>> gpuTable = [ //empty, full, user
    ["empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"],
    ["full", "full", "full", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"],
    ["full", "full", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"],
    ["full", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"],
    ["full", "full", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"],
    ["full", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"]];

  int nGpu = 0;
  int time = 0;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    setState((){
      //old = get from data
      //gpuTable = get from data
      while (Utils.toDate(old) != Utils.toDate(DateTime.now())){
        for (var j = 0; j < 13; j++){
          for (var i = 0; i < 8; i++){
            gpuTable[i][j] = gpuTable[i][j+1];
          }
        }
        for (var i = 0; i < 8; i++){
          gpuTable[i][13] = "empty";
        }
        old = old.add(const Duration(days: 1));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оборудование'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () =>
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Menu())
                ),
          ),
        ],
      ),
      body: Column(
        children:<Widget> [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Распределение времени использования GPU", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(color: Colors.blueGrey),
              children: [
                row(0),
                row(1),
                row(2),
                row(3),
                row(4),
                row(5),
                row(6),
                row(7)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              children: [
                TableRow(
                  children:[
                    const RotatedBox(quarterTurns: -1, child: Text(" "),),
                    RotatedBox(quarterTurns: -1, child: dateLine(0),),
                    RotatedBox(quarterTurns: -1, child: dateLine(1),),
                    RotatedBox(quarterTurns: -1, child: dateLine(2),),
                    RotatedBox(quarterTurns: -1, child: dateLine(3),),
                    RotatedBox(quarterTurns: -1, child: dateLine(4),),
                    RotatedBox(quarterTurns: -1, child: dateLine(5),),
                    RotatedBox(quarterTurns: -1, child: dateLine(6),),
                    RotatedBox(quarterTurns: -1, child: dateLine(7),),
                    RotatedBox(quarterTurns: -1, child: dateLine(8),),
                    RotatedBox(quarterTurns: -1, child: dateLine(9),),
                    RotatedBox(quarterTurns: -1, child: dateLine(10),),
                    RotatedBox(quarterTurns: -1, child: dateLine(11),),
                    RotatedBox(quarterTurns: -1, child: dateLine(12),),
                    RotatedBox(quarterTurns: -1, child: dateLine(13),)
                  ]
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          child:  const Icon(Icons.queue),
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title:  const Text('Зарезервировать оборудование'),
                shape:  const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                content:
                SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration:  const InputDecoration(
                          labelText: 'Число требуемых GPU',
                        ),
                        onChanged: (String nGpuS){
                          nGpu = int.parse(nGpuS);
                        },
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration:  const InputDecoration(
                          labelText: 'Длительность вычислений (в днях)',
                        ),
                        onChanged: (String timeS){
                          time = int.parse(timeS);
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        addToTable(nGpu, time);
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue
                    ),
                    child:  const Text('Зарезервировать'),
                  )
                ],
              );
            });
          }
      ),
    );
  }

  Container cell(String isEmpty){
    if(isEmpty == "empty"){
      return Container(height: 50, color: Colors.white);
    }
    else if(isEmpty == "full"){
      return Container(height: 50, color: Colors.red);
    }
    else {
      return Container(height: 50, color: Colors.blue);
    }
  }

  TableRow row(int n){
    return TableRow(children: [
      Text(" №$n", style: const TextStyle(color: Colors.blue),), cell(gpuTable[n][0]), cell(gpuTable[n][1]), cell(gpuTable[n][2]), cell(gpuTable[n][3]), cell(gpuTable[n][4]), cell(gpuTable[n][5]), cell(gpuTable[n][6]), cell(gpuTable[n][7]), cell(gpuTable[n][8]), cell(gpuTable[n][9]), cell(gpuTable[n][10]), cell(gpuTable[n][11]), cell(gpuTable[n][12]), cell(gpuTable[n][13]),
    ]);
  }
  
  Text dateLine(int n){
    return Text(Utils.toDate(DateTime.now().add(Duration(days: n))), style: const TextStyle(color: Colors.blue, fontSize: 16));
  }

  void addToTable(int nGpu, int time){
    int freeGpuInRow;
    bool lineOk;
    int linesOk;
    int done;
    dynamic i, j;
    for(j = 0; j < 14; j++){
      freeGpuInRow = 0;
      if(j + time < 15){
        for (i = 0; i < 8; i++){
          if(gpuTable[i][j] == "empty") {freeGpuInRow++;}
        }
        if (freeGpuInRow >= nGpu){
          linesOk = 0;
          for (i = 0; i < 8; i++){
            lineOk = true;
            for (var t = 0; t < time; t++){
              if (gpuTable[i][j + t] != "empty") {lineOk = false;}
            }
            if (lineOk) {linesOk++;}
          }
          if(linesOk >= nGpu){
            done = 0;
            for (i = 0; i < 8; i++){
              lineOk = true;
              for (var t = 0; t < time; t++){
                if (gpuTable[i][j + t] != "empty") {lineOk = false;}
              }
              if (lineOk) {
                for (var t = 0; t < time; t++){
                  gpuTable[i][j + t] = "user";
                }
                done++;
                if (done == nGpu) {return;}
                //save information on server
              }
            }
          }
        }
        if (j + time == 14 && freeGpuInRow < nGpu){
          showDialog(context: context, builder: (BuildContext context) =>
              AlertDialog(
                title: Text("В данное время ($nGpu) GPU недоступно на такой срок ($time дней)"),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child: const Text('OK'),
                  )
                ],
              ),
          );
        }
      }
    }
    showDialog(context: context, builder: (BuildContext context) =>
        AlertDialog(
          title: const Text("Измените длительность вычислений или попробуйте позже"),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
                },
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: const Text('OK'),
            )
          ],
        ),
    );
  }
}