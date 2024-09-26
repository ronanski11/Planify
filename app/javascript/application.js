// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs" // Import Rails UJS
Rails.start() // Start UJS to handle data-method and other Rails helpers
