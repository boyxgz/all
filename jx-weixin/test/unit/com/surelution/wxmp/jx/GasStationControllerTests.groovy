package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(GasStationController)
@Mock(GasStation)
class GasStationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gasStation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gasStationInstanceList.size() == 0
        assert model.gasStationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.gasStationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gasStationInstance != null
        assert view == '/gasStation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gasStation/show/1'
        assert controller.flash.message != null
        assert GasStation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gasStation/list'

        populateValidParams(params)
        def gasStation = new GasStation(params)

        assert gasStation.save() != null

        params.id = gasStation.id

        def model = controller.show()

        assert model.gasStationInstance == gasStation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gasStation/list'

        populateValidParams(params)
        def gasStation = new GasStation(params)

        assert gasStation.save() != null

        params.id = gasStation.id

        def model = controller.edit()

        assert model.gasStationInstance == gasStation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gasStation/list'

        response.reset()

        populateValidParams(params)
        def gasStation = new GasStation(params)

        assert gasStation.save() != null

        // test invalid parameters in update
        params.id = gasStation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gasStation/edit"
        assert model.gasStationInstance != null

        gasStation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gasStation/show/$gasStation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gasStation.clearErrors()

        populateValidParams(params)
        params.id = gasStation.id
        params.version = -1
        controller.update()

        assert view == "/gasStation/edit"
        assert model.gasStationInstance != null
        assert model.gasStationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gasStation/list'

        response.reset()

        populateValidParams(params)
        def gasStation = new GasStation(params)

        assert gasStation.save() != null
        assert GasStation.count() == 1

        params.id = gasStation.id

        controller.delete()

        assert GasStation.count() == 0
        assert GasStation.get(gasStation.id) == null
        assert response.redirectedUrl == '/gasStation/list'
    }
}
