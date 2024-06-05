import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CardRegistration extends StatefulWidget {
  const CardRegistration({super.key});

  @override
  State<CardRegistration> createState() => _CardRegistrationState();
}

class _CardRegistrationState extends State<CardRegistration> {
  final controller = WebViewController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    bool isFirstLoad = true;

    internetCheck(context);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            if (isFirstLoad) {
              controller.runJavaScript('''
              // Select the body element
              const bodyElement = document.querySelector('body');

              // Add the "modal-open" class and padding style
              bodyElement.classList.add('modal-open');
              bodyElement.style.paddingRight = '15px';

              // Select the verifyModal element
              const verifyModalElement = document.getElementById('verifyModal');

              // Change the display style to block
              verifyModalElement.style.display = 'block';

              // Create a new modal-backdrop element
              const modalBackdrop = document.createElement('div');
              modalBackdrop.classList.add('modal-backdrop', 'fade', 'in');

              // Append the modal-backdrop to the body before the closing </body> tag
              bodyElement.appendChild(modalBackdrop);

              // Select all elements except the registration modal
              var allElements = document.body.children;
              var modal = document.getElementById('verifyModal');

              // Loop through all elements and hide them except the modal
              for (var i = 0; i < allElements.length; i++) {
                  if (allElements[i] !== modal) {
                      allElements[i].style.display = 'none';
                  }
              }

              \$('#verifyModal').modal('show');

              // Function to remove the top attribute from the specific media query
              function removeTopFromModal() {
                  for (var i = 0; i < document.styleSheets.length; i++) {
                      var sheet = document.styleSheets[i];
                      try {
                          for (var j = 0; j < sheet.cssRules.length; j++) {
                              var rule = sheet.cssRules[j];
                              if (rule.media && rule.media.mediaText === '(max-width: 480px)') {
                                  var cssRules = rule.cssRules || rule.rules;
                                  for (var k = 0; k < cssRules.length; k++) {
                                      var cssRule = cssRules[k];
                                      if (cssRule.selectorText === '.modal.fade.in') {
                                          cssRule.style.removeProperty('top');
                                      }
                                  }
                              }
                          }
                      } catch (e) {
                          // Some CSS rules may not be accessible due to cross-origin restrictions
                          console.error(e);
                      }
                  }
              }

              // Remove the top attribute when the document is fully loaded
              removeTopFromModal();
              ''');
            }

            if (isLoading) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://rapidpass.com.bd'));
  }

  void internetCheck(BuildContext context) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    // Internet Connection Check
    if (connectivityResult.contains(ConnectivityResult.none)) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text(
            'দয়া করে ইন্টারনেট সংযোগ দিন!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                Navigator.pop(context, 'OK');
              },
              child: const Text('আচ্ছা'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('রেজিস্ট্রেশন'),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : WebViewWidget(controller: controller),
      ),
    );
  }
}
