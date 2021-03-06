require 'test_helper'

class RingtonesControllerTest < ActionController::TestCase
  context "GET :index" do
    setup { get :index }

    should respond_with(:ok)
    should render_template(:index)
  end

  context "GET :show" do
    setup do
      @ringtone = create(:ringtone)
      get :show, id: @ringtone
    end

    should respond_with(:ok)
    should render_template(:show)
  end

  context "GET :new" do
    setup { get :new }

    should respond_with(:ok)
    should render_template(:new)
  end

  context "POST :create" do
    context "with valid params" do
      setup do
        params = { ringtone: { song: "Ringtone", artist: "The Toners",
                               source: fixture_file_upload('files/test.mp3', 'audio/mp3') } }
        post :create, params
      end

      should "create a new ringtone" do
        ringtone = assigns[:ringtone]
        assert_not_nil ringtone
        assert ringtone.persisted?
      end

      should "redirect to new ringtone" do
        assert_redirected_to assigns[:ringtone]
      end
    end

    context "with invalid params" do
      setup do
        post :create, ringtone: { song: "" }
      end

      should render_template(:new)
    end
  end
end
