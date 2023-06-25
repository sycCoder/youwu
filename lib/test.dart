import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewPageState();
  }
}

class _ListViewPageState extends State<ListViewPage> {
  // ListView数据集合
  final List<String> _list = List.generate(20, (i) => '原始数据${i + 1}');
  late ScrollController _scrollController;
  bool isLoading = false; // 是否正在加载更多

  @override
  void initState() {
    super.initState();
    // 初始化ScrollController
    _scrollController = ScrollController();
    // 监听ListView是否滚动到底部
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        // 滑动到了底部
        print('滑动到了底部');
        // 这里可以执行上拉加载逻辑
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表的下拉刷新和上拉加载'),
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (index < _list.length) {
                return ListTile(
                  title: Text(_list[index]),
                );
              } else {
                // 最后一项，显示加载更多布局
                return _buildLoadMoreItem();
              }
            },
            itemCount: _list.length + 1,
            controller: _scrollController,
          ),
        ),
      ),
    );
  }

  // 加载更多布局
  Widget _buildLoadMoreItem() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("加载中..."),
      ),
    );
  }

  // 下拉刷新方法
  Future<Null> _handleRefresh() async {
    // 模拟数据的延迟加载
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // 在列表开头添加几条数据
        List<String> _refreshData = List.generate(5, (i) => '下拉刷新数据${i + 1}');
        _list.insertAll(0, _refreshData);
      });
    });
  }

  // 上拉加载
  Future<Null> _loadMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      // 模拟数据的延迟加载
      await Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          List<String> _loadMoreData =
          List.generate(5, (i) => '上拉加载数据${i + 1}');
          _list.addAll(_loadMoreData);
        });
      });
    }
  }
}