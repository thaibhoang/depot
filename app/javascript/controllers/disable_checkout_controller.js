import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disable-checkout"
export default class extends Controller {
  static targets = ["checkout"]

  initialize() {
    this.setupTurboStreamListener()  
     
  }

  setupTurboStreamListener() {
    
    document.addEventListener('turbo:load', () => {
      // disable when first visit the order page
      this.disableCheckout() 
      const cartDiv = document.getElementById('cart');
      if (cartDiv) {        
        window.addEventListener('cartLoaded', () => {
          // disable everytime cart is reloaded
          this.disableCheckout();
        });
      }
    })
  }

  inOrderPage() {
    const order_form = document.querySelector("#order-form")
    return order_form != null
  }

  disableCheckout() {
    this.checkoutTarget.disable = this.checkoutTarget.hidden = this.inOrderPage()
  }
}
