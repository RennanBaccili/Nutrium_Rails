import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
  }
  perform(){
    this.element.requestSubmit();
  }
}
