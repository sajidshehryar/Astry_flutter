import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'api_request_type.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage(
      {super.key, required this.callBack, required this.apiRequest});
  final ApiRequest apiRequest;
  final Function(ApiRequest apiRequest) callBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(Assets.assetsNoInternet),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Oops!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'No internet connection found.Please check your connection or try again.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () async {
                  context.pop();
                    await callBack(apiRequest);
                  },
                  child: const Text(
                    'Refresh',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}