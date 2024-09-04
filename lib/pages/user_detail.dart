import 'package:first_app/models/user.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  final User user;
  const UserDetail({super.key, required this.user});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    User user = widget.user;

    return Scaffold(
      appBar: AppBar(
        title:
            Text('${user.name!.title}.${user.name!.first} ${user.name!.last}'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Hero(
                tag: '${user.email}',
                child: ClipOval(
                  child: Image.network(
                    user.picture!.large!,
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${user.name!.title}.${user.name!.first} ${user.name!.last}',
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              //generateTable(user),
              generateDataTable(user)
            ],
          ),
        ),
      ),
    );
  }

  Widget generateTable(User user) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const <int, TableColumnWidth>{
        //0: FixedColumnWidth(100),
        0: IntrinsicColumnWidth(),
        //1: FlexColumnWidth(),
        //2: FixedColumnWidth(64),
      },
      border: TableBorder.all(color: Colors.blueAccent, width: 1),
      children: [
        const TableRow(
          children: [
            Center(
                child: Text(
              'Key',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            )),
            Center(
                child: Text(
              'Value',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ))
          ],
        ),
        TableRow(
          children: [
            const Center(
              child: Text(
                'UUID:',
                style: TextStyle(
                    height: 2,
                    fontSize: 12,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(child: Text('\t ${user.login!.uuid}'))
          ],
        ),
        TableRow(
          children: [
            const Center(
              child: Text(
                'Username:',
                style: TextStyle(
                    height: 2,
                    fontSize: 12,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(child: Text('\t ${user.login!.username}'))
          ],
        ),
        TableRow(
          children: [
            const Center(
              child: Text(
                'Password:',
                style: TextStyle(
                    height: 2,
                    fontSize: 12,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(child: Text('\t ${user.login!.password}'))
          ],
        ),
        TableRow(
          children: [
            const Center(
              child: Text(
                'SALT:',
                style: TextStyle(
                    height: 2,
                    fontSize: 12,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(child: Text('\t ${user.login!.salt}'))
          ],
        ),
      ],
    );
  }

  Widget generateDataTable(User user) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: _createColumns(),
        rows: _createRows(user),
        dividerThickness: 2,
        //dataRowMaxHeight: 35,
        //dataRowMinHeight: 30,
        showBottomBorder: true,
        columnSpacing: MediaQuery.of(context).size.width * 0.2,

        headingTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        headingRowColor:
            WidgetStateProperty.resolveWith((states) => Colors.deepPurple),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
          label: Text(
        'Key',
      )),
      const DataColumn(
          label: Text(
        'Value',
      )),
    ];
  }

  List<DataRow> _createRows(User user) {
    return [
      DataRow(cells: [
        const DataCell(
          Text(
            'UUID:',
            style: TextStyle(
                height: 2,
                fontSize: 12,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(Text('\t ${user.login!.uuid}')),
      ]),
      DataRow(cells: [
        const DataCell(
          Text(
            'Username:',
            style: TextStyle(
                height: 2,
                fontSize: 12,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(Text('\t ${user.login!.username}'), showEditIcon: true),
      ]),
      DataRow(cells: [
        const DataCell(
          Text(
            'Password:',
            style: TextStyle(
                height: 2,
                fontSize: 12,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(Text('\t ${user.login!.password}')),
      ]),
      DataRow(cells: [
        const DataCell(
          Text(
            'Salt:',
            style: TextStyle(
                height: 2,
                fontSize: 12,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(Text('\t ${user.login!.salt}')),
      ]),
      DataRow(cells: [
        const DataCell(
          Text(
            'SHA1:',
            style: TextStyle(
                height: 2,
                fontSize: 12,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(Text('\t ${user.login!.sha1}')),
      ]),
      DataRow(cells: [
        const DataCell(
          Text(
            'SHA256:',
            style: TextStyle(
                height: 2,
                fontSize: 12,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(Text('\t ${user.login!.sha256}')),
      ]),
      DataRow(cells: [
        const DataCell(
          Text(
            'MD5:',
            style: TextStyle(
                height: 2,
                fontSize: 12,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(Text('\t ${user.login!.md5}')),
      ]),
    ];
  }
}
