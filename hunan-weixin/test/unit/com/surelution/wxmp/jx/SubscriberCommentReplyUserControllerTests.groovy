package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(SubscriberCommentReplyUserController)
@Mock(SubscriberCommentReplyUser)
class SubscriberCommentReplyUserControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subscriberCommentReplyUser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subscriberCommentReplyUserInstanceList.size() == 0
        assert model.subscriberCommentReplyUserInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subscriberCommentReplyUserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subscriberCommentReplyUserInstance != null
        assert view == '/subscriberCommentReplyUser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subscriberCommentReplyUser/show/1'
        assert controller.flash.message != null
        assert SubscriberCommentReplyUser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subscriberCommentReplyUser/list'

        populateValidParams(params)
        def subscriberCommentReplyUser = new SubscriberCommentReplyUser(params)

        assert subscriberCommentReplyUser.save() != null

        params.id = subscriberCommentReplyUser.id

        def model = controller.show()

        assert model.subscriberCommentReplyUserInstance == subscriberCommentReplyUser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subscriberCommentReplyUser/list'

        populateValidParams(params)
        def subscriberCommentReplyUser = new SubscriberCommentReplyUser(params)

        assert subscriberCommentReplyUser.save() != null

        params.id = subscriberCommentReplyUser.id

        def model = controller.edit()

        assert model.subscriberCommentReplyUserInstance == subscriberCommentReplyUser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subscriberCommentReplyUser/list'

        response.reset()

        populateValidParams(params)
        def subscriberCommentReplyUser = new SubscriberCommentReplyUser(params)

        assert subscriberCommentReplyUser.save() != null

        // test invalid parameters in update
        params.id = subscriberCommentReplyUser.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subscriberCommentReplyUser/edit"
        assert model.subscriberCommentReplyUserInstance != null

        subscriberCommentReplyUser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subscriberCommentReplyUser/show/$subscriberCommentReplyUser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subscriberCommentReplyUser.clearErrors()

        populateValidParams(params)
        params.id = subscriberCommentReplyUser.id
        params.version = -1
        controller.update()

        assert view == "/subscriberCommentReplyUser/edit"
        assert model.subscriberCommentReplyUserInstance != null
        assert model.subscriberCommentReplyUserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subscriberCommentReplyUser/list'

        response.reset()

        populateValidParams(params)
        def subscriberCommentReplyUser = new SubscriberCommentReplyUser(params)

        assert subscriberCommentReplyUser.save() != null
        assert SubscriberCommentReplyUser.count() == 1

        params.id = subscriberCommentReplyUser.id

        controller.delete()

        assert SubscriberCommentReplyUser.count() == 0
        assert SubscriberCommentReplyUser.get(subscriberCommentReplyUser.id) == null
        assert response.redirectedUrl == '/subscriberCommentReplyUser/list'
    }
}
