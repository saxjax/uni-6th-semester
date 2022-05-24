import pytest

from booking.models import Booking
from account.models import User, Account
from location.models import Location, MachineModel, Service, Machine
from security.models import Log
from electricity.models import ElectricityBlock


@pytest.mark.django_db
def test_first_user_has_functioning_default_values(first_user):
    first_user.save()

    assert isinstance(first_user, User)


@pytest.mark.django_db
def test_second_user_has_functioning_default_values(second_user):
    second_user.save()

    assert isinstance(second_user, User)


@pytest.mark.django_db
def test_first_account_has_functioning_default_values(first_account, first_user):
    first_account.save()

    assert isinstance(first_account, Account)
    assert first_account.owners.all()[0].id == first_user.id


@pytest.mark.django_db
def test_second_account_has_functioning_default_values(second_account, second_user):
    second_account.save()

    assert isinstance(second_account, Account)
    assert second_account.owners.all()[0].id == second_user.id


@pytest.mark.django_db
def test_first_machine_model_has_functioning_default_values(first_machine_model):
    first_machine_model.save()

    assert isinstance(first_machine_model, MachineModel)


@pytest.mark.django_db
def test_second_machine_model_has_functioning_default_values(second_machine_model):
    second_machine_model.save()

    assert isinstance(second_machine_model, MachineModel)


@pytest.mark.django_db
def test_first_service_has_functioning_default_values(first_service, first_machine_model):
    first_service.save()

    assert isinstance(first_service, Service)
    assert first_service.machine_model.id == first_machine_model.id


@pytest.mark.django_db
def test_second_service_has_functioning_default_values(second_service, second_machine_model):
    second_service.save()

    assert isinstance(second_service, Service)
    assert second_service.machine_model.id == second_machine_model.id


@pytest.mark.django_db
def test_first_location_has_functioning_default_values(first_location, first_user):
    first_location.save()

    assert isinstance(first_location, Location)
    assert first_location.owner.id == first_user.id


@pytest.mark.django_db
def test_second_location_has_functioning_default_values(second_location, second_user):
    second_location.save()

    assert isinstance(second_location, Location)
    assert second_location.owner.id == second_user.id


@pytest.mark.django_db
def test_first_machine_has_functioning_default_values(first_machine, first_location, first_user):
    first_machine.save()

    assert isinstance(first_machine, Machine)
    assert first_machine.location.id == first_location.id
    assert first_machine.owner.id == first_user.id


@pytest.mark.django_db
def test_second_machine_has_functioning_default_values(second_machine, second_location, second_user):
    second_machine.save()

    assert isinstance(second_machine, Machine)
    assert second_machine.location.id == second_location.id
    assert second_machine.owner.id == second_user.id


@pytest.mark.django_db
def test_first_booking_has_functioning_default_values(first_booking, first_account, first_service, first_machine):
    first_booking.save()

    assert isinstance(first_booking, Booking)
    assert first_booking.account.id == first_account.id
    assert first_booking.service.id == first_service.id
    assert first_booking.machine.id == first_machine.id


@pytest.mark.django_db
def test_second_booking_has_functioning_default_values(second_booking, second_account, second_service, second_machine):
    second_booking.save()

    assert isinstance(second_booking, Booking)
    assert second_booking.account.id == second_account.id
    assert second_booking.service.id == second_service.id
    assert second_booking.machine.id == second_machine.id


@pytest.mark.django_db
def test_first_electricity_block_has_functioning_default_values(first_electricity_block):
    first_electricity_block.save()

    assert isinstance(first_electricity_block, ElectricityBlock)


@pytest.mark.django_db
def test_second_electricity_block_has_functioning_default_values(second_electricity_block):
    second_electricity_block.save()

    assert isinstance(second_electricity_block, ElectricityBlock)


@pytest.mark.django_db
def test_first_log_has_functioning_default_values(first_log, first_user):
    first_log.save()

    assert isinstance(first_log, Log)
    assert first_log.user.id == first_user.id


@pytest.mark.django_db
def test_second_log_has_functioning_default_values(second_log, second_user):
    second_log.save()

    assert isinstance(second_log, Log)
    assert second_log.user.id == second_user.id
