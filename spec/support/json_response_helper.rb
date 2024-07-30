# frozen_string_literal: true

module JsonResponseHelper
  def json_body
    JSON.parse(response.body).with_indifferent_access
  end

  def json_data
    json_body[:data]
  end

  def json_attribute
    json_data[:attributes]
  end
end
