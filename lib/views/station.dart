import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Station extends StatefulWidget {
  const Station({super.key});

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  final controller = WebViewController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

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
            controller.runJavaScript('''
              // Select the body element
              const bodyElement = document.body;

              // Remove the background of the body
              bodyElement.style.background = 'none';

              // Select the parent element with the class 'inner-page'
              const innerPageElement = document.querySelector('.inner-page');

              // Get all child elements of the 'inner-page' element
              const childElements = innerPageElement.children;

              // Loop through the child elements
              for (let i = 0; i < childElements.length; i++) {
                  // Check if the current element is not the one with id 'contents'
                  if (childElements[i].id === 'contents') {
                      // Get the element with the id 'contents'
                      const contentsElement = childElements[i];
                      
                      // Get all child elements of the 'contents' element
                      const contentsChildElements = contentsElement.children;

                      // Loop through the child elements of 'contents'
                      for (let j = 0; j < contentsChildElements.length; j++) {
                          // Check if the current element's id is not 'left-content'
                          if (contentsChildElements[j].id !== 'left-content') {
                              // Hide the element if it's not the one with id 'left-content'
                              contentsChildElements[j].style.display = 'none';
                          }
                      }
                  } else {
                      // Hide the element if it's not the one with id 'contents'
                      childElements[i].style.display = 'none';
                  }
              }

              // Hide the elements with ids 'footer-artwork' and 'footer-wrapper'
              const footerArtworkElement = document.getElementById('footer-artwork');
              if (footerArtworkElement) {
                  footerArtworkElement.style.display = 'none';
              }

              const footerWrapperElement = document.getElementById('footer-wrapper');
              if (footerWrapperElement) {
                  footerWrapperElement.style.display = 'none';
              }

              // Hide the div elements with ids 'share-buttons'
              const shareButtonElements = document.querySelectorAll('#share-buttons');
              shareButtonElements.forEach(element => {
                  element.style.display = 'none';
              });

              // Hide the div elements with ids 'print_btn_div'
              const printBtnDivElement = document.getElementById('print_btn_div');
              if (printBtnDivElement) {
                  printBtnDivElement.style.display = 'none';
              }

              // Hide the div elements with ids 'accessibilityBar', 'onlinePollBlock', and 'onlineCommentBlock'
              const accessibilityBarElement = document.getElementById('accessibilityBar');
              if (accessibilityBarElement) {
                  accessibilityBarElement.style.display = 'none';
              }

              const onlinePollBlockElement = document.getElementById('onlinePollBlock');
              if (onlinePollBlockElement) {
                  onlinePollBlockElement.style.display = 'none';
              }

              const onlineCommentBlockElement = document.getElementById('onlineCommentBlock');
              if (onlineCommentBlockElement) {
                  onlineCommentBlockElement.style.display = 'none';
              }
            ''');

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
      ..loadRequest(Uri.parse(
          'https://dmtcl.gov.bd/site/page/a7e6f9f0-5d88-4eb5-857e-1b0ba3415858/-'));
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
          title: const Text('স্টেশন'),
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
