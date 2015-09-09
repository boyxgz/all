package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(WeatherItemController)
@Mock(WeatherItem)
class WeatherItemControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/weatherItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.weatherItemInstanceList.size() == 0
        assert model.weatherItemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.weatherItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.weatherItemInstance != null
        assert view == '/weatherItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/weatherItem/show/1'
        assert controller.flash.message != null
        assert WeatherItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/weatherItem/list'

        populateValidParams(params)
        def weatherItem = new WeatherItem(params)

        assert weatherItem.save() != null

        params.id = weatherItem.id

        def model = controller.show()

        assert model.weatherItemInstance == weatherItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/weatherItem/list'

        populateValidParams(params)
        def weatherItem = new WeatherItem(params)

        assert weatherItem.save() != null

        params.id = weatherItem.id

        def model = controller.edit()

        assert model.weatherItemInstance == weatherItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/weatherItem/list'

        response.reset()

        populateValidParams(params)
        def weatherItem = new WeatherItem(params)

        assert weatherItem.save() != null

        // test invalid parameters in update
        params.id = weatherItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/weatherItem/edit"
        assert model.weatherItemInstance != null

        weatherItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/weatherItem/show/$weatherItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        weatherItem.clearErrors()

        populateValidParams(params)
        params.id = weatherItem.id
        params.version = -1
        controller.update()

        assert view == "/weatherItem/edit"
        assert model.weatherItemInstance != null
        assert model.weatherItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/weatherItem/list'

        response.reset()

        populateValidParams(params)
        def weatherItem = new WeatherItem(params)

        assert weatherItem.save() != null
        assert WeatherItem.count() == 1

        params.id = weatherItem.id

        controller.delete()

        assert WeatherItem.count() == 0
        assert WeatherItem.get(weatherItem.id) == null
        assert response.redirectedUrl == '/weatherItem/list'
    }
}
