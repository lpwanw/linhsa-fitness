# frozen_string_literal: true

Cloudinary.config_from_url(ENV.fetch("CLOUDINARY_URL")) if Rails.env.production?
