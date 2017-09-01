# frozen_string_literal: true

require 'rails/generators/base'
require 'ideo_rails/environments'
require 'ideo_rails/helpers'

module IdeoRails

  # EvntInitializerGenerator.
  class EvntInitializerGenerator < Rails::Generators::Base

    include IdeoRails::Helpers

    source_root File.expand_path('../../../templates/evnt_initializer', __FILE__)

    desc 'This function initialize your Rails project to support Evnt.'
    def create_evnt_initializer
      # write messages to user
      write_messages

      # copy templates
      manage_commands
      manage_events
      manage_handlers

      # update application codes
      update_application

      # run other generators
      run_model_generator
    end

    private

    def write_messages
      print_important "Remember to active the 'evnt' gem on your Gemfile"
    end

    def manage_commands
      # copy commands
      copy_file('app/commands/application_command.rb',
                'app/commands/application_command.rb')
    end

    def manage_events
      # copy events
      copy_file('app/events/application_event.rb',
                'app/events/application_event.rb')
    end

    def manage_handlers
      # copy handlers
      copy_file('app/handlers/application_handler.rb',
                'app/handlers/application_handler.rb')
    end

    def update_application
      # autoload actions directory
      application "config.autoload_paths += %W[\#{Rails.root}/app/commands]"

      # autoload events directory
      application "config.autoload_paths += %W[\#{Rails.root}/app/events]"

      # autoload handlers directory
      application "config.autoload_paths += %W[\#{Rails.root}/app/handlers]"
    end

    def run_model_generator
      # generate event model used to save events
      generate 'model', 'Event name:string payload:text'
    end

  end

end
