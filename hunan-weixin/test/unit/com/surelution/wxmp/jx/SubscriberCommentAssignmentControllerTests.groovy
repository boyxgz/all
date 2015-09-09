package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(SubscriberCommentAssignmentController)
@Mock(SubscriberCommentAssignment)
class SubscriberCommentAssignmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subscriberCommentAssignment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subscriberCommentAssignmentInstanceList.size() == 0
        assert model.subscriberCommentAssignmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subscriberCommentAssignmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subscriberCommentAssignmentInstance != null
        assert view == '/subscriberCommentAssignment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subscriberCommentAssignment/show/1'
        assert controller.flash.message != null
        assert SubscriberCommentAssignment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subscriberCommentAssignment/list'

        populateValidParams(params)
        def subscriberCommentAssignment = new SubscriberCommentAssignment(params)

        assert subscriberCommentAssignment.save() != null

        params.id = subscriberCommentAssignment.id

        def model = controller.show()

        assert model.subscriberCommentAssignmentInstance == subscriberCommentAssignment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subscriberCommentAssignment/list'

        populateValidParams(params)
        def subscriberCommentAssignment = new SubscriberCommentAssignment(params)

        assert subscriberCommentAssignment.save() != null

        params.id = subscriberCommentAssignment.id

        def model = controller.edit()

        assert model.subscriberCommentAssignmentInstance == subscriberCommentAssignment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subscriberCommentAssignment/list'

        response.reset()

        populateValidParams(params)
        def subscriberCommentAssignment = new SubscriberCommentAssignment(params)

        assert subscriberCommentAssignment.save() != null

        // test invalid parameters in update
        params.id = subscriberCommentAssignment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subscriberCommentAssignment/edit"
        assert model.subscriberCommentAssignmentInstance != null

        subscriberCommentAssignment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subscriberCommentAssignment/show/$subscriberCommentAssignment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subscriberCommentAssignment.clearErrors()

        populateValidParams(params)
        params.id = subscriberCommentAssignment.id
        params.version = -1
        controller.update()

        assert view == "/subscriberCommentAssignment/edit"
        assert model.subscriberCommentAssignmentInstance != null
        assert model.subscriberCommentAssignmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subscriberCommentAssignment/list'

        response.reset()

        populateValidParams(params)
        def subscriberCommentAssignment = new SubscriberCommentAssignment(params)

        assert subscriberCommentAssignment.save() != null
        assert SubscriberCommentAssignment.count() == 1

        params.id = subscriberCommentAssignment.id

        controller.delete()

        assert SubscriberCommentAssignment.count() == 0
        assert SubscriberCommentAssignment.get(subscriberCommentAssignment.id) == null
        assert response.redirectedUrl == '/subscriberCommentAssignment/list'
    }
}
