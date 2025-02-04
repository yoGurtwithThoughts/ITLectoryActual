import 'package:flutter/material.dart';
import 'package:it_lectory_3/widgets/style_text.dart';

class AnswerButton extends StatefulWidget {
  final String answer; // The answer text
  final bool isSelected; // Whether this button is selected
  final bool isCorrect; // Whether this answer is correct
  final VoidCallback onTap; // Callback function when tapped
  final bool isAnswered; // Flag to track if the question has already been answered

  AnswerButton({
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
    required this.isAnswered, // New parameter to check if the question has been answered
  });

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Animation controller for scaling effect
  late Animation<double> _scaleAnimation; // Scale animation
  bool _isTapped = false; // Track if the button has been tapped

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _handleTap() {
    if (widget.isAnswered) {
      return; // Prevent double answering
    }

    _controller.forward().then((_) {
      setState(() {
        _isTapped = true; // Mark the button as tapped
      });
      widget.onTap(); // Call the onTap callback
      _controller.reverse(); // Reverse the animation
    });
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    IconData? iconData;

    // Determine button color and icon based on selection and correctness
    if (widget.isSelected) {
      if (widget.isCorrect) {
        buttonColor = Colors.green; // Correct answer color
        iconData = Icons.check; // Check icon for correct answer
      } else {
        buttonColor = Colors.red; // Incorrect answer color
        iconData = Icons.close; // Cross icon for incorrect answer
      }
    } else {
      buttonColor = Colors.transparent; // Transparent when not selected
      iconData = null; // No icon when not selected
    }

    return ScaleTransition(
      scale: _scaleAnimation, // Apply scale animation
      child: GestureDetector(
        onTap: _handleTap, // Handle tap event
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 8), // Add spacing between buttons
          decoration: BoxDecoration(
            color: buttonColor, // Set background color based on selection state
            borderRadius: BorderRadius.circular(8), // Rounded corners
            border: Border.all(color: Colors.blue), // Blue border for all buttons
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.answer,
                  style: _isTapped ? TextStylesMain.alltxt : TextStylesMain.chattxt, // Change style based on tap state
                ),
              ),
              if (iconData != null)
                Icon(
                  iconData,
                  color: Colors.black, // Icon color set to black for visibility
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }
}