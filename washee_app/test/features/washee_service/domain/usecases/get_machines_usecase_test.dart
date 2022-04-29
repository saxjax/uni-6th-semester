import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:washee/core/usecases/usecase.dart';
import 'package:washee/core/washee_box/machine_model.dart';
import 'package:washee/features/get_machines/domain/repositories/get_machines_repository.dart';
import 'package:washee/features/get_machines/domain/usecases/get_machines.dart';

class MockGetMachinesUseCaseRepo extends Mock implements GetMachinesRepository {
}

void main() {
  late GetMachinesUseCase usecase;
  late MockGetMachinesUseCaseRepo mockRepo;

  setUp() {
    mockRepo = MockGetMachinesUseCaseRepo();
    usecase = GetMachinesUseCase(repository: mockRepo);
  }

  test(
    'should verify a call has been made to the repository',
    () async {
      // arrange
      List<MachineModel> mockMachines = [
        MachineModel(
            machineID: "machineID", name: "name", machineType: "machineType")
      ];

      setUp();
      when(() => mockRepo.getMachines()).thenAnswer((_) async => mockMachines);

      // act
      final result = await usecase.call(NoParams());

      // assert
      expect(result, mockMachines);
      verify(() => mockRepo.getMachines()).called(1);
    },
  );
}