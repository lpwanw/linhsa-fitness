# frozen_string_literal: true

require "rails_helper"

RSpec.describe GuestsController, type: :controller do
  describe "POST #create" do
    subject { post :create, params:, format: :turbo_stream }

    context "when valid attributes" do
      let(:params) do
        {
          guest: {
            name: "John Doe",
            phone: "0356786954",
            note: "Some note",
            free_time: "Evening",
          },
        }
      end

      context "when change Guest count" do
        it { expect { subject }.to change(Guest, :count).by(1) }
      end

      context "when response" do
        before { subject }

        it { expect(response).to be_successful }
        it { expect(response).to render_template(:create, format: :turbo_stream) }
        it { expect(flash.now[:notice]).to eq(I18n.t("guests.create.success")) }
      end
    end

    context "when invalid attributes" do
      let(:params) do
        {
          guest: {
            name: "",
            phone: "0356786954",
            note: "Some note",
            free_time: "Evening",
          },
        }
      end

      context "when change Guest count" do
        it { expect { subject }.not_to change(Guest, :count) }
      end

      context "when response" do
        before { subject }

        it { expect(response).to be_successful }
        it { expect(response).to render_template(:create, format: :turbo_stream) }
        it { expect(flash.now[:alert]).to eq(I18n.t("guests.create.failed")) }
      end
    end
  end
end
