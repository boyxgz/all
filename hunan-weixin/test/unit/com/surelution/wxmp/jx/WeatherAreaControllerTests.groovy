package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(WeatherAreaController)
@Mock(WeatherArea)
class WeatherAreaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/weatherArea/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.weatherAreaInstanceList.size() == 0
        assert model.weatherAreaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.weatherAreaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.weatherAreaInstance != null
        assert view == '/weatherArea/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/weatherArea/show/1'
        assert controller.flash.message != null
        assert WeatherArea.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/weatherArea/list'

        populateValidParams(params)
        def weatherArea = new WeatherArea(params)

        assert weatherArea.save() != null

        params.id = weatherArea.id

        def model = controller.show()

        assert model.weatherAreaInstance == weatherArea
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/weatherArea/list'

        populateValidParams(params)
        def weatherArea = new WeatherArea(params)

        assert weatherArea.save() != null

        params.id = weatherArea.id

        def model = controller.edit()

        assert model.weatherAreaInstance == weatherArea
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/weatherArea/list'

        response.reset()

        populateValidParams(params)
        def weatherArea = new WeatherArea(params)

        assert weatherArea.save() != null

        // test invalid parameters in update
        params.id = weatherArea.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/weatherArea/edit"
        assert model.weatherAreaInstance != null

        weatherArea.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/weatherArea/show/$weatherArea.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        weatherArea.clearErrors()

        populateValidParams(params)
        params.id = weatherArea.id
        params.version = -1
        controller.update()

        assert view == "/weatherArea/edit"
        assert model.weatherAreaInstance != null
        assert model.weatherAreaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/weatherArea/list'

        response.reset()

        populateValidParams(params)
        def weatherArea = new WeatherArea(params)

        assert weatherArea.save() != null
        assert WeatherArea.count() == 1

        params.id = weatherArea.id

        controller.delete()

        assert WeatherArea.count() == 0
        assert WeatherArea.get(weatherArea.id) == null
        assert response.redirectedUrl == '/weatherArea/list'
    }
}
