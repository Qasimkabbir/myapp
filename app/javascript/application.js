// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "noty"  // Import the Noty toast notification library
import Rails from 'rails-ujs'
Rails.start()


// You can write your custom JavaScript code here to trigger notifications
function showToast(message, type = 'success') {
  new Noty({
    text: message,
    type: type,
    layout: 'topRight',
    timeout: 3000
  }).show();
}