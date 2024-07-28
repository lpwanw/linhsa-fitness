# frozen_string_literal: true

module JsonResponseHelper
  def json_body
    JSON.parse(response.body).with_indifferent_access
  end

  def json_data
    json_body[:data]
  end

  def json_success
    json_body[:success]
  end

  def json_errors
    json_body[:errors]
  end
end
