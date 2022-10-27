import { Controller } from "@hotwired/stimulus";
import AOS from 'aos';
import 'aos/dist/aos.css';

// Connects to data-controller="aos"
export default class extends Controller {
  connect() {
    AOS.init({
      duration: 10000,
    });
  }
}
