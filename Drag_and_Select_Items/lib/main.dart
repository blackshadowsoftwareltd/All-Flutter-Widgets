import 'package:drag_and_select_items/Resource.dart';
import 'package:drag_and_select_items/selectebleImage.dart';
import 'package:flutter/material.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> urlList = urlImage;
  final controller = DragSelectGridViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(rebuildState);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    controller.removeListener(rebuildState);
  }

  @override
  Widget build(BuildContext context) {
    final isItemSelected = controller.value.isSelecting;
    String title = isItemSelected
        ? '${controller.value.amount} Images Selected'
        : 'Drag & Seleted Grid lists';
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: isItemSelected ? CancleButton() : Container(),
          actions: [isItemSelected ? PrivewButton() : Container()],
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DragSelectGridView(
                itemCount: urlImage.length,
                gridController: controller,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index, isSelected) => SelectebleImage(
                    imgUrl: urlImage[index], isSelected: isSelected))));
  }

  void rebuildState() => setState(() {});
  Widget CancleButton() => IconButton(
      icon: Icon(Icons.close, color: Colors.white),
      onPressed: () => controller.clear());
  Widget PrivewButton() => IconButton(
      icon: Icon(Icons.photo_size_select_actual, color: Colors.white),
      onPressed: () {
        final selectedImages = controller.value.selectedIndexes
            .map<String>((index) => urlImage[index])
            .toList();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PreviewImages(urlImage: selectedImages)));
      });
}
