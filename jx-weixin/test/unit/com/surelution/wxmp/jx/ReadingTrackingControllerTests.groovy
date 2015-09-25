package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(ReadingTrackingController)
@Mock(ReadingTracking)
class ReadingTrackingControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/readingTracking/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.readingTrackingInstanceList.size() == 0
        assert model.readingTrackingInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.readingTrackingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.readingTrackingInstance != null
        assert view == '/readingTracking/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/readingTracking/show/1'
        assert controller.flash.message != null
        assert ReadingTracking.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/readingTracking/list'

        populateValidParams(params)
        def readingTracking = new ReadingTracking(params)

        assert readingTracking.save() != null

        params.id = readingTracking.id

        def model = controller.show()

        assert model.readingTrackingInstance == readingTracking
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/readingTracking/list'

        populateValidParams(params)
        def readingTracking = new ReadingTracking(params)

        assert readingTracking.save() != null

        params.id = readingTracking.id

        def model = controller.edit()

        assert model.readingTrackingInstance == readingTracking
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/readingTracking/list'

        response.reset()

        populateValidParams(params)
        def readingTracking = new ReadingTracking(params)

        assert readingTracking.save() != null

        // test invalid parameters in update
        params.id = readingTracking.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/readingTracking/edit"
        assert model.readingTrackingInstance != null

        readingTracking.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/readingTracking/show/$readingTracking.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        readingTracking.clearErrors()

        populateValidParams(params)
        params.id = readingTracking.id
        params.version = -1
        controller.update()

        assert view == "/readingTracking/edit"
        assert model.readingTrackingInstance != null
        assert model.readingTrackingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/readingTracking/list'

        response.reset()

        populateValidParams(params)
        def readingTracking = new ReadingTracking(params)

        assert readingTracking.save() != null
        assert ReadingTracking.count() == 1

        params.id = readingTracking.id

        controller.delete()

        assert ReadingTracking.count() == 0
        assert ReadingTracking.get(readingTracking.id) == null
        assert response.redirectedUrl == '/readingTracking/list'
    }
}
