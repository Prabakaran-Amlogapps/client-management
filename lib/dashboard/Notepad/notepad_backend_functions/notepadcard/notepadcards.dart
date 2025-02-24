import 'package:employee_client_management/dashboard/Notepad/notepad_backend_functions/screens/notepade_list.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:employee_client_management/models/Note.dart';
import 'package:employee_client_management/dashboard/Notepad/notepad_backend_functions/screens/notepad_form.dart';
import 'package:intl/intl.dart';

class DashboardNoteCard extends StatefulWidget {
  const DashboardNoteCard({Key? key}) : super(key: key);

  @override
  State<DashboardNoteCard> createState() => _DashboardNoteCardState();
}

class _DashboardNoteCardState extends State<DashboardNoteCard> {
  Note? _latestNote;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchLatestNote();
  }

  Future<void> _fetchLatestNote() async {
    try {
      final notes = await Amplify.DataStore.query(
        Note.classType,
        sortBy: [Note.CREATEDAT.descending()],
      );

      if (mounted) {
        setState(() {
          _latestNote = notes.isNotEmpty ? notes.first : null;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Error fetching note: ${e.toString()}';
          _isLoading = false;
        });
      }
    }
  }

  String _formatDate(TemporalDateTime? dateTime) {
    if (dateTime == null) return 'Unknown date';

    final date = dateTime.getDateTimeInUtc();
    return DateFormat('MMM dd, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Latest Note',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NoteForm(),
                      ),
                    );
                  },
                  child: const Text('New Note'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NoteListScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildCardContent(),
        ],
      ),
    );
  }

  Widget _buildCardContent() {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            _errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    if (_latestNote == null) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'No notes yet. Create your first note!',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteForm(note: _latestNote),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    _latestNote!.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: _latestNote!.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                      color:
                          _latestNote!.isCompleted ? Colors.grey : Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (_latestNote!.isCompleted)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 18,
                  ),
              ],
            ),
            const SizedBox(height: 6),
            if (_latestNote!.description != null &&
                _latestNote!.description!.isNotEmpty)
              Text(
                _latestNote!.description!,
                style: TextStyle(
                  fontSize: 14,
                  color:
                      _latestNote!.isCompleted ? Colors.grey : Colors.black87,
                  decoration: _latestNote!.isCompleted
                      ? TextDecoration.lineThrough
                      : null,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
