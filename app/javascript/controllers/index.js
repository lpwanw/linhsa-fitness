// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DarkController from "./dark_controller"
application.register("dark", DarkController)

import DrawerController from "./drawer_controller"
application.register("drawer", DrawerController)

import Flash__ComponentController from "./flash/component_controller"
application.register("flash--component", Flash__ComponentController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)
