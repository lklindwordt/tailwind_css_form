import { application } from "./application"

// Register all controllers in this directory
import ComboboxController from "./combobox_controller"
application.register("combobox", ComboboxController)
