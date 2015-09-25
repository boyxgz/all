package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(AwardingStatusController)
@Mock(AwardingStatus)
class AwardingStatusControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/awardingStatus/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.awardingStatusInstanceList.size() == 0
        assert model.awardingStatusInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.awardingStatusInstance != null
    }

    void testSave() {
        controller.save()

        assert model.awardingStatusInstance != null
        assert view == '/awardingStatus/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/awardingStatus/show/1'
        assert controller.flash.message != null
        assert AwardingStatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/awardingStatus/list'

        populateValidParams(params)
        def awardingStatus = new AwardingStatus(params)

        assert awardingStatus.save() != null

        params.id = awardingStatus.id

        def model = controller.show()

        assert model.awardingStatusInstance == awardingStatus
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/awardingStatus/list'

        populateValidParams(params)
        def awardingStatus = new AwardingStatus(params)

        assert awardingStatus.save() != null

        params.id = awardingStatus.id

        def model = controller.edit()

        assert model.awardingStatusInstance == awardingStatus
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/awardingStatus/list'

        response.reset()

        populateValidParams(params)
        def awardingStatus = new AwardingStatus(params)

        assert awardingStatus.save() != null

        // test invalid parameters in update
        params.id = awardingStatus.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/awardingStatus/edit"
        assert model.awardingStatusInstance != null

        awardingStatus.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/awardingStatus/show/$awardingStatus.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        awardingStatus.clearErrors()

        populateValidParams(params)
        params.id = awardingStatus.id
        params.version = -1
        controller.update()

        assert view == "/awardingStatus/edit"
        assert model.awardingStatusInstance != null
        assert model.awardingStatusInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/awardingStatus/list'

        response.reset()

        populateValidParams(params)
        def awardingStatus = new AwardingStatus(params)

        assert awardingStatus.save() != null
        assert AwardingStatus.count() == 1

        params.id = awardingStatus.id

        controller.delete()

        assert AwardingStatus.count() == 0
        assert AwardingStatus.get(awardingStatus.id) == null
        assert response.redirectedUrl == '/awardingStatus/list'
    }
}
