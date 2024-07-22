# frozen_string_literal: true

Cloudinary.config_from_url(ENV.fetch("CLOUDINARY_URL", nil)) if Rails.env.production?
