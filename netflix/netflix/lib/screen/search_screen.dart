import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/model_movie.dart';
import 'package:netflix/screen/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data!.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<DocumentSnapshot> searchResults = [];
    for (DocumentSnapshot d in snapshot) {
      if (d.data.toString().contains(_searchText)) {
        searchResults.add(d);
      }
    }
    return Expanded(
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.5,
            padding: EdgeInsets.all(3),
            children: searchResults
                .map((data) => _buildListItem(context, data))
                .toList()));
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final movie = Movie.fromSnapshot(data);
    return InkWell(
      child: Image.network(movie.poster),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return DetailScreen(movie: movie);
            }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.black,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    focusNode: focusNode,
                    style: TextStyle(fontSize: 15),
                    autofocus: true,
                    controller: _filter,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white60,
                        size: 20,
                      ),
                      suffixIcon: focusNode.hasFocus
                          ? IconButton(
                              icon: Icon(Icons.cancel, size: 20),
                              onPressed: () {
                                setState(() {
                                  _filter.clear();
                                  _searchText = "";
                                });
                              },
                            )
                          : Container(),
                      hintText: '검색',
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                focusNode.hasFocus
                    ? Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _filter.clear();
                                _searchText = " ";
                                focusNode.unfocus();
                              });
                            },
                            child: const Text('취소')))
                    : Expanded(
                        flex: 0,
                        child: Container(),
                      ),
              ],
            ),
          ),
          _buildBody(context)
        ],
      ),
    );
  }
}
