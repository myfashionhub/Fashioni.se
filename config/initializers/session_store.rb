# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, 
                                        key: '_fashionize_sessions'
                                        :expire_after => 5.minutes
