import 'package:dosytkom/features/auth/domain/use_case/country_use_case.dart';
import 'package:dosytkom/features/auth/presentation/state/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CountryCubit extends Cubit<CountryState> {
  final FetchCountriesUseCase fetchCountriesUseCase;

  CountryCubit(this.fetchCountriesUseCase) : super(CountryInitial());

  Future<void> getCountries() async {
  emit(CountryLoading());

  try {
    final countries = await fetchCountriesUseCase();
    emit(CountryLoaded(countries)); 
  } catch (e) {
    emit(CountryError("فشل تحميل الدول"));
  }
}

}
