import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samim/core/utils/constants.dart';
import 'package:samim/features/country/presentation/bloc/country_bloc.dart';
import 'package:samim/features/country/presentation/bloc/country_status.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  void initState() {
    BlocProvider.of<CountryBloc>(context).add(const LoadCountryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: BlocBuilder<CountryBloc, CountryBlocState>(
                builder: (context, state) {
              if (state.countryStatus is CountryLoading) {
                return Container(
                  padding: EdgeInsets.only(top: size.height * 0.3),
                  child: CircularProgressIndicator(
                      color: Constants.colorPrimaryMain),
                );
              }
              if (state.countryStatus is CountryCompleted) {
                CountryCompleted countryCompleted =
                    state.countryStatus as CountryCompleted;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: countryCompleted.countryEntity.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'نام کشور',
                                  style: TextStyle(
                                      fontSize: Constants.fontParagraph1,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      () {
                                        var text = countryCompleted
                                            .countryEntity[i].name
                                            .toString();
                                        int maxLen = 30;

                                        var t = '';
                                        if (text.length > maxLen) {
                                          for (var i = 0; i < maxLen; i++) {
                                            t += text[i];
                                          }
                                          t += '...';
                                          return t;
                                        } else {
                                          return text;
                                        }
                                      }(),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Yekan'),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: SvgPicture.network(
                                        countryCompleted.countryEntity[i].flag!,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'نام پایتخت',
                                  style: TextStyle(
                                      fontSize: Constants.fontParagraph1,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  countryCompleted.countryEntity[i].capital
                                      .toString(),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }
              if (state.countryStatus is CountryError) {
                return const Text('Error');
              }
              return const Text('initial');
            }),
          ),
        ),
      ),
    );
  }
}
