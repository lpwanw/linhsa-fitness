# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "flowbite", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.turbo.min.js"
pin "@stimulus-components/notification", to: "@stimulus-components--notification.js" # @3.0.0
pin "stimulus-use" # @0.52.2
pin "motion" # @10.18.0
pin "@motionone/animation", to: "@motionone--animation.js" # @10.18.0
pin "@motionone/dom", to: "@motionone--dom.js" # @10.18.0
pin "@motionone/easing", to: "@motionone--easing.js" # @10.18.0
pin "@motionone/generators", to: "@motionone--generators.js" # @10.18.0
pin "@motionone/types", to: "@motionone--types.js" # @10.17.1
pin "@motionone/utils", to: "@motionone--utils.js" # @10.18.0
pin "hey-listen" # @1.0.8
pin "tslib" # @2.6.3
