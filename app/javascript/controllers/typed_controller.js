import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';


// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    var typed = new Typed(this.element, {
      strings: ["Make your own movie lists.", "Share lists with friends."],
      typeSpeed: 30, loop: true
    });

  }
}
